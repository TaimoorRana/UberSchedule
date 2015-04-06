class SequenceBuilderController < ApplicationController
  layout 'application'
  before_action :authenticate_user!

def sequence_builder
  @log = Logger.new("log3.txt") #Logger Class instance used to debug
  @log.level = Logger::DEBUG #all lines starting with @log.info are just there to log shit.

  user_id = current_user.user_id
  @student = Student.where(user_id: user_id).first
  preferences = @student.preferences
  preferences.exists?(15) ? @semester_counter = 0 : @semester_counter = 1 # 0 = Fall Entry, 1 = Winter Entry
  preferences.exists?(14) ? @allowSummer = true : @allowSummer = false

  @semester_counter = 0 #We will take the mod 2 or 3 of this value to obtain the current semester.
  @semester = {0 => "Fall", 1 => "Winter", 2 => "Summer"} #Hash to convert semester counter to semester string
  preferences = @student.preferences
  preferences.exists?(15) ? @semester_counter = 0 : @semester_counter = 1 # 0 = Fall Entry, 1 = Winter Entry
  preferences.exists?(14) ? @allowSummer = true : @allowSummer = false #not implemented
  @semester_modulo = @allowSummer ? 3 : 2 #3 for summer, #2 for no summers

  max_credits = 120 #change accordingly. Could be made flexible.
  @year = 2015 #same

  # ----------------------------------------------------------------------------------------------------------
  # The purpose of the following block of code is to grab as much relevant information from the db
  # as possible and to shove in arrays of Objects. The names should be descriptive enough. For more information
  # see the individual method calls.
  # Using instance variables because they are easier to work with.
  # Protip: click a method and press Ctrl+B to jump to method declaration

  @all_sections = Array.new
  sections_to_array

  @all_fall_sections = Array.new
  @all_summer_sections = Array.new
  @all_winter_sections = Array.new
  @all_given_sections = {0 => @all_fall_sections, 1 => @all_winter_sections, 2 => @all_summer_sections}
  sort_sections_by_term

  @fall_courses_only = Array.new
  @winter_courses_only = Array.new
  @courses_offered_in_summer = Array.new
  courses_given_in_specific_semester

  @mandatory_courses = Array.new
  @oneOf_courses = Array.new
  @listOfCourses = params[:electives]
  generate_mandatory_courses

  @all_prereqs = Array.new
  @all_coreqs = Array.new #TODO not yet used! Creates problems mainly for COMP390
  @all_200_level = Array.new
  @all_400_level = Array.new
  @completed_all_200_level = false #later checked via determine_completed_all_200_level method
  all_prereqs_to_array
  all_coreqs_to_array
  generate_all_200_and_400_level

  @completed_courses = Array.new
  completed_courses_to_array

  @accumulated_credits = 0
  initial_accumulated_credits

  @all_basic_sciences = Array.new
  @all_general_electives = Array.new
  @basic_science_counter = 0
  @general_elective_counter = 0
  @ignore_list = Array.new
  @all_options = Array.new
  generate_basic_sciences
  generate_general_electives
  generate_ignore_list
  hardcoded_hash_of_skill

  @complete_sequence = Array.new # Will be populated by current_semester Arrays detailed in the upcoming while loop.

  # This while loop will control the creation of the entire sequence. The end result is a fully generated sequence
  # stored in @complete_sequence.
  while @accumulated_credits < max_credits
    current_semester = Array.new #will contain STRINGS following the order: [semester detail] [Courses dept + Number] [accumulated credits]
    courses_to_schedule = ""
    @log.info("========== STARTING TO GENERATE A SEMESTER =============")
    semester_string = determine_current_semester
    @log.info("Semester:" + semester_string)

    current_semester.push(semester_string) # push semester detail for display purposes
    available_courses = generate_available_courses # available course = {course not yet taken} - {course that don't meet prereqs}
    selected_courses = sequence_generator(available_courses) # from available courses, select the ones with highest priority

    selected_courses.each do |course| # pushes string form of selected courses to the current_semester array.
      if @all_basic_sciences.include?(course)
        @basic_science_counter +=1
      end
      if @all_general_electives.include?(course)
        @general_elective_counter += 1
      end
      current_semester.push(course.dept + " " + course.number.to_s)
      @completed_courses.push(course)
      if course.number != 490
        @accumulated_credits += course.credit
      elsif semester_string.include?("Winter")
        @accumulated_credits += course.credit
      end

      @log.info("!!! ADDED " + course.dept + course.number.to_s + " to current semester")
    end
    i = 1
    (i..current_semester.size - 1).each do |i|
      courses_to_schedule.concat(current_semester[i])
      if i < (current_semester.size - 1)
        courses_to_schedule.concat(",")
      end
    end
    @log.info("Taimoor string:" + courses_to_schedule)
    current_semester.push(courses_to_schedule)
    current_semester.push(@accumulated_credits.to_s) # push accumulated credits to current_semester
    @complete_sequence.push(current_semester)

    if !@completed_all_200_level #check if the boolean for completed 200 level courses is true or false.
      determine_completed_all_200_level
    end
    @semester_counter+=1 #increment semester counter to correctly select the following semester
    @log.info("semester_counter: " + @semester_counter.to_s)
  end #end of while loop

end #END OF def sequence_builder

# ---------------------------------------------------------------------------------------------------------------
# Here ends the main method of the sequence_builder. The following methods either populate an instance variable
# or manipulate the data in some (hopefully) useful way. Don't expect detailed comments for methods that simply
# convert DB associations and relations to arrays!
#---------------------------------------------------------------------------------------------------------------

def sections_to_array
  Section.all.each do |section|
    @all_sections.push(section)
    # @log.info("@all_sections <= " + section.id.to_s)
  end
end

# Separates by term the @all_sections array into smaller arrays.
# Used to limit the operations in the generate_available_course method and to ensure that a course not given in a
# semester doesn't appear to be available for that semester.
def sort_sections_by_term
  @all_sections.each do |section|
    if section.term == "Fall"
      @all_fall_sections.push(section)
      # @log.info("@all_fall_sections <= " + section.id.to_s)
    elsif section.term == "Winter"
      @all_winter_sections.push(section)
      # @log.info("@all_winter_sections <= " + section.id.to_s)
    elsif section.term = "Summer"
      @all_summer_sections.push(section)
      # @log.info("@all_summer_sections <= " + section.id.to_s)
    end
  end
end

# populates the @fall_courses_only, @winter_courses_only and @courses_offered_in_summer arrays with Course objects
# Checks in which semester all the Courses are given. Uses the information to determine whether a course is given
# exclusively in the fall or the winter, or whether a Summer section for a course exists.
# The information will be used to evaluate the priority of the available courses for a given semester.
def courses_given_in_specific_semester
  offered_in_fall = false
  offered_in_winter = false
  offered_in_summer = false
  current_course_id = 1
  @all_sections.each do |section|
    if current_course_id != section.course_id # used to prevent multiple checks of the same Course.
      course = Course.find(current_course_id)
      if offered_in_summer # the offered_ booleans correspond to the previous course! See **REF** to see where they are declared
        @courses_offered_in_summer.push(course)
        @log.info("@courses_offered_in_summer <= " + course.dept + course.number.to_s)
      else
        if offered_in_fall and !offered_in_winter # Courses offered in Fall only
          @fall_courses_only.push(course)
          @log.info("@fall_courses_only <= " + course.dept + course.number.to_s)
        end
        if !offered_in_fall and offered_in_winter # Courses offered in Winter only
          @winter_courses_only.push(course)
          @log.info("@winter_courses_only <= " + course.dept + course.number.to_s)
        end
      end
      current_course_id = section.course_id
      offered_in_fall = false
      offered_in_winter = false
      offered_in_summer = false
    end #end if current_course_id != section.course_id
    # **REF**
    if section.term == "Fall"
      offered_in_fall = true
    elsif section.term == "Winter"
      offered_in_winter = true
    elsif section.term == "Summer"
      offered_in_summer = true
    end
  end #end do loop
end #end of courses_given_in specific_semester

# Prereq_type_id: 1 = normal prereqs. ie: no concurrent.
def all_prereqs_to_array
  CoursesPrereq.where(prereq_type_id: 1).all.each do |prereq|
    @all_prereqs.push(prereq)
    @log.info("@all_prereqs <= " + prereq.course_id.to_s + " " + prereq.course_id_prereq.to_s)
  end
end

# Prereq_type_id: 3 = Prereq can be taken previously or concurrently.
# TODO implement this in the course selection.
def all_coreqs_to_array
  CoursesPrereq.where(prereq_type_id: 3).all.each do |coreq|
    @all_coreqs.push(coreq)
    @log.info("@all_coreqs <= " + coreq.course_id.to_s + " " + coreq.course_id_prereq.to_s)
  end
end

# initially populated by courses which the student has already taken.
# courses which are selected into a semester are also added to this list.
# completed_courses are filtered out of available_courses, and they serve to check if prereqs have been met.
def completed_courses_to_array
  @student.courses.each do |course|
    @completed_courses.push(course)
    @log.info("@completed_courses <= " + course.dept + course.number.to_s)
  end
end


# for a course, return the list of all prereqs of type 1 (normal prereqs, corequisites are excluded!)
def get_prereqs(course)
  arr = Array.new
  @all_prereqs.each do |prereq|
    if (prereq.course_id == course.course_id) and (prereq.course_id != 0) # added this last part because the db has a random prereq entry for id 0...
      arr.push(prereq)
      @log.info("get_prereqs("+course.dept+course.number.to_s+") <= " + prereq.course_id.to_s + " " + prereq.course_id_prereq.to_s)
    end
  end
  return arr
end

def initial_accumulated_credits
  @completed_courses.each do |course|
    @accumulated_credits+= course.credit
    @log.info("initial accumulated credits =" + @accumulated_credits.to_s)
  end
end

# @semester_modulo depends on the students preference for summer courses. 3 = summers, 2 = no summers
# When a semester is Winter, increment the year count.
def determine_current_semester
  current_semester_string = @semester[@semester_counter.modulo(@semester_modulo)]
  if current_semester_string == "Winter"
    @year+=1
  end
  current_year = @year.to_s
  return current_semester_string + " " + current_year
end

# --- MAJOR METHOD ---
# This method is at the core of the sequence_builder. It's purpose is to produce the set of available courses for the
# current semester. An available course is a course which has not yet been completed and whose prereqs of type 1 have
# been completed. Level 400 courses have the additional requirement that all mandatory 200 level courses must completed
# before they can be taken.
# The list of available courses will then be used by the selector method which will pick the 4-5 courses with the highes
# priority to be taken for the current semester.
# Returns Array of Course objects.
def generate_available_courses
  available_courses = Array.new
  all_given_sections = @all_given_sections[@semester_counter.modulo(@semester_modulo)] # find all sections given in a term
  previous_course_id = 0
  all_given_sections.each do |section|
    if previous_course_id != section.course_id #prevents double checking Courses
      previous_course_id = section.course_id
      course = Course.find(section.course_id)
      if !@completed_courses.include?(course) and !@ignore_list.include?(course) #check if course was taken or is on ignore list.
        missing_prereqs = false # assume no missing prereqs. Following lines try to find missing prereqs.
        if @all_400_level.include?(course) #if course is a 400 level, check if all 200 level are completed.
          missing_prereqs = !@completed_all_200_level
          log_string = missing_prereqs ? "true" : "false"
          @log.info("400-400-400 check if 400 is missing 200 level: " + log_string)
        end
        basic_sciences_allowed = true # assume basic sciences allowed.
        if @all_basic_sciences.include?(course) and (@basic_science_counter >= 2) #if course is basic science and 2 basic already chosen, don't allow.
          basic_sciences_allowed = false #TODO It is possible that more than 2 sciences are available. Must make sure that the selection logic
          #TODO doesn't allow for the selection of >2 sciences in a given semester. Use @basic_science_counter.
        end
        general_elective_allowed = true
        if @all_general_electives.include?(course) and (@general_elective_counter >= 1)
          general_elective_allowed = false
        end
        if CoursesPrereq.where(course_id: course).size > 0 and missing_prereqs == false #if course has prereqs and hasn't failed yet.
          prereqs = get_prereqs(course)
          prereqs.each do |p|
            if !@completed_courses.include?(Course.find(p.course_id_prereq)) #too lazy to prevent this DB call
              missing_prereqs = true
            end
          end
        end #if has prereq
        if !missing_prereqs and basic_sciences_allowed and general_elective_allowed # if no missing prereqs and not an invalid basic science, push to available.
          available_courses.push(course)
          @log.info("available_courses <=" + course.dept + course.number.to_s)
        end
      end
    end #end of prevent doubles
  end #end of loop thru all sections
  return available_courses
end #end of generate_available_courses

def course_to_s(course)
  return course.dept + " " + course.number.to_s
end

def generate_all_200_and_400_level
  Course.all.each do |x| # lazy way to exclude electives. Was made before implementation of @mandatory_courses
    if @mandatory_courses.include?(x) and x.number > 200 and x.number < 300 and x.number != 242 and x.number != 243 and x.number != 244 and x.number != 245 and (x.dept = "SOEN" or x.dept = "COMP" or x.dept = "ENGR")
      @all_200_level.push(x)
      @log.info("all_200_level <=" + x.dept + x.number.to_s)
    elsif x.number > 400
      @all_400_level.push(x)
      @log.info("all_400_level <=" + x.dept + x.number.to_s)
    end
  end
end

# check if all the courses in the all_200_level array are also in the completed_courses array
def determine_completed_all_200_level
  completed_them_all = true
  @all_200_level.each do |course|
    if !@completed_courses.include?(course)
      completed_them_all = false
      break
    end
  end
  @completed_all_200_level = completed_them_all
end

def generate_basic_sciences #hardcoded because they aren't in the DB yet
  @all_basic_sciences.push(Course.find(5)) #ENGR242
  @all_basic_sciences.push(Course.find(6)) #ENGR243
  (79..90).each do |i|
    @all_basic_sciences.push(Course.find(i))
  end
end

def generate_general_electives
  Course.all.each do |course|
    if course.dept == "MARK" or course.dept == "MANA" or course.dept == "ADMI" or course.dept == "URBS"
      @all_general_electives.push(course)
    end
  end
end

def generate_ignore_list #courses that are in the DB but should never be taken
  @ignore_list.push(Course.find(7)) #ENGR244 is not a basic science
  @ignore_list.push(Course.find(8)) #ENGR245 is not a basic science
end

def generate_mandatory_courses
  Sequence.find(1).courses.each do |course|
    @mandatory_courses.push(course)
    @log.info("@mandatory_course <=" + course.dept + course.number.to_s)
  end
  if @student.option == "Computer Games"
    Sequence.find(12).courses.each do |course|
      @mandatory_courses.push(course)
      @log.info("@mandatory_course <=" + course.dept + course.number.to_s)
    end
    Sequence.find(13).courses.each do |course|
      @oneOf_courses.push(course)
      @log.info("@oneOf_courses <=" + course.dept + course.number.to_s)
    end
  elsif @student.option == "Web Services and Appliactions"
    Sequence.find(10).courses.each do |course|
      @mandatory_courses.push(course)
      @log.info("@mandatory_course <=" + course.dept + course.number.to_s)
    end
    Sequence.find(11).courses.each do |course|
      @oneOf_courses.push(course)
      @log.info("@oneOf_courses <=" + course.dept + course.number.to_s)
    end
  elsif @student.option == "RealTime Embedded and Avionics Software"
    Sequence.find(14).courses.each do |course|
      @mandatory_courses.push(course)
      @log.info("@mandatory_course <=" + course.dept + course.number.to_s)
    end
    Sequence.find(15).courses.each do |course|
      @oneOf_courses.push(course)
      @log.info("@oneOf_courses <=" + course.dept + course.number.to_s)
    end
  end
  @listOfCourses.each do |c|
    course = Course.find(c.to_i)
    @mandatory_courses.push(course)
    @log.info("@mandatory_course from Arek's thing <=" + course.dept + course.number.to_s)
  end
end

def sequence_generator(available)
  @log.info(".....sequence_generator.....")
  selected_courses = Array.new
  priority_1 = Array.new
  priority_2 = Array.new
  priority_3 = Array.new
  priority_4 = Array.new
  priority_5 = Array.new
  priority_6 = Array.new
  course_counter = 0

  if @semester[@semester_counter.modulo(@semester_modulo)] == "Fall"
    courses_given_this_term_only = @fall_courses_only
    check_for_capstone
  elsif @semester[@semester_counter.modulo(@semester_modulo)] == "Winter"
    courses_given_this_term_only = @winter_courses_only
  elsif @semester[@semester_counter.modulo(@semester_modulo)] == "Summer"
    courses_given_this_term_only = @courses_offered_in_summer
    if available.include?(Course.find(60))
      available.delete(Course.find(60))
    end
  end

  if @capstone_available and @semester[@semester_counter.modulo(@semester_modulo)] != "Summer"
    selected_courses.push(Course.find(60))
    course_counter += 1
  end

  courses_per_semester = (@semester[@semester_counter.modulo(@semester_modulo)] == "Summer") ? 4 : 5
  max_courses = [courses_per_semester, available.size].min

  #check if courses with type 3 prereqs are really available
  available.each do |avail|
    @log.info("Checking if " + avail.dept + avail.number.to_s + " has coreqs!")

    @all_coreqs.each do |coreq|
      if avail.course_id == coreq.course_id
        prereq = Course.find(coreq.course_id_prereq)
        @log.info(avail.dept + avail.number.to_s + " has coreq " + prereq.dept + prereq.number.to_s)
        if !available.include?(prereq) and !@completed_courses.include?(prereq)
          @log.info("Removed " + avail.dept + avail.number.to_s + " from available!")
          available.delete(avail)
        end
      end
    end #end of coreq do
  end #end of available do

  @log.info("The following courses are available for the next semester: ")
  available.each do |avail|
    @log.info(avail.dept + avail.number.to_s)
  end

  available.each do |course|
    priority = @skills[course]
    mandatory = @mandatory_courses.include?(course)
    given_this_semester_only = courses_given_this_term_only.include?(course)
    basic_science = @all_basic_sciences.include?(course)
    @log.info("$$$$ " + course.dept + course.number.to_s + ": mandatory=" + mandatory.to_s + ", priority: " + priority.to_s +
                  ", given only this semester=" + given_this_semester_only.to_s)

    if given_this_semester_only and mandatory and priority < 3 and !basic_science
      priority_1.push(course)
      @log.info("Priority 1 <= " + course.dept + course.number.to_s)
    elsif mandatory and priority < 2 and !basic_science
      priority_2.push(course)
      @log.info("Priority 2 <= " + course.dept + course.number.to_s)
    elsif given_this_semester_only and priority < 5 and !basic_science
      priority_3.push(course)
      @log.info("Priority 3 <= " + course.dept + course.number.to_s)
    elsif mandatory and priority < 7 and !basic_science
      priority_4.push(course)
      @log.info("Priority 4 <= " + course.dept + course.number.to_s)
    elsif mandatory
      priority_5.push(course)
      @log.info("Priority 5 <= " + course.dept + course.number.to_s)
    else
      priority_6.push(course)
      @log.info("Priority 6 <= " + course.dept + course.number.to_s)
    end
    @log.info("The following courses are available for the next semester: ")
    available.each do |avail|
      @log.info(avail.dept + avail.number.to_s)
    end
  end

  while course_counter < max_courses
    if priority_1[0] != nil
      selected_courses.push(priority_1[0])
      @log.info("SELECTED COURSE: " + priority_1[0].dept + priority_1[0].number.to_s)
      priority_1.delete(priority_1[0])
    elsif priority_2[0] != nil
      selected_courses.push(priority_2[0])
      @log.info("SELECTED COURSE: " + priority_2[0].dept + priority_2[0].number.to_s)
      priority_2.delete(priority_2[0])
    elsif priority_3[0] != nil
      selected_courses.push(priority_3[0])
      @log.info("SELECTED COURSE: " + priority_3[0].dept + priority_3[0].number.to_s)
      priority_3.delete(priority_3[0])
    elsif priority_4[0] != nil
      selected_courses.push(priority_4[0])
      @log.info("SELECTED COURSE: " + priority_4[0].dept + priority_4[0].number.to_s)
      priority_4.delete(priority_4[0])
    elsif priority_5[0] != nil
      selected_courses.push(priority_5[0])
      @log.info("SELECTED COURSE: " + priority_5[0].dept + priority_5[0].number.to_s)
      priority_5.delete(priority_5[0])
    elsif priority_6[0] != nil
      selected_courses.push(priority_6[0])
      @log.info("SELECTED COURSE: " + priority_6[0].dept + priority_6[0].number.to_s)
      priority_6.delete(priority_6[0])
    end
    course_counter +=1
  end
  return selected_courses
end #end of method

def check_for_capstone
  complete_course_counter = 0
  capstone = Course.find(60)
  course_ids = [46, 47, 48, 54] # course_ids of the Capstone prereqs
  course_ids.each do |i|
    if @completed_courses.include?(Course.find(i)) and !@completed_courses.include?(capstone)
      complete_course_counter+=1
    end
  end
  @capstone_available = (complete_course_counter == 4) ? true : false
  @log.info("Capstone available = " + @capstone_available.to_s)
end


# 1 is highest, 10 is lowest
def hardcoded_hash_of_skill
  @skills = Hash.new
  @skills[Course.find(1)] = 6
  @skills[Course.find(2)] = 6
  @skills[Course.find(3)] = 3
  @skills[Course.find(4)] = 5
  @skills[Course.find(5)] = 10
  @skills[Course.find(6)] = 10
  @skills[Course.find(7)] = 10
  @skills[Course.find(8)] = 10
  @skills[Course.find(9)] = 6
  @skills[Course.find(10)] = 5
  @skills[Course.find(11)] = 5
  @skills[Course.find(12)] = 5
  @skills[Course.find(14)] = 1
  @skills[Course.find(15)] = 1
  @skills[Course.find(16)] = 1
  @skills[Course.find(17)] = 1
  @skills[Course.find(18)] = 10
  @skills[Course.find(19)] = 6
  @skills[Course.find(20)] = 9
  @skills[Course.find(21)] = 7
  @skills[Course.find(22)] = 1
  @skills[Course.find(23)] = 4
  @skills[Course.find(24)] = 1
  @skills[Course.find(25)] = 7
  @skills[Course.find(26)] = 7
  @skills[Course.find(27)] = 7
  @skills[Course.find(28)] = 9
  @skills[Course.find(29)] = 9
  @skills[Course.find(30)] = 9
  @skills[Course.find(31)] = 9
  @skills[Course.find(32)] = 9
  @skills[Course.find(33)] = 9
  @skills[Course.find(34)] = 9
  @skills[Course.find(35)] = 9
  @skills[Course.find(36)] = 9
  @skills[Course.find(37)] = 9
  @skills[Course.find(38)] = 9
  @skills[Course.find(41)] = 1
  @skills[Course.find(42)] = 4
  @skills[Course.find(43)] = 5
  @skills[Course.find(44)] = 6
  @skills[Course.find(45)] = 1
  @skills[Course.find(46)] = 1
  @skills[Course.find(47)] = 1
  @skills[Course.find(48)] = 1
  @skills[Course.find(49)] = 1
  @skills[Course.find(50)] = 3
  @skills[Course.find(51)] = 4
  @skills[Course.find(52)] = 2
  @skills[Course.find(53)] = 6
  @skills[Course.find(54)] = 1
  @skills[Course.find(55)] = 7
  @skills[Course.find(56)] = 7
  @skills[Course.find(57)] = 7
  @skills[Course.find(58)] = 7
  @skills[Course.find(59)] = 7
  @skills[Course.find(60)] = 1
  @skills[Course.find(62)] = 7
  @skills[Course.find(63)] = 7
  @skills[Course.find(64)] = 7
  @skills[Course.find(65)] = 7
  @skills[Course.find(66)] = 7
  @skills[Course.find(67)] = 2
  @skills[Course.find(72)] = 10
  @skills[Course.find(73)] = 10
  @skills[Course.find(74)] = 10
  @skills[Course.find(75)] = 10
  @skills[Course.find(76)] = 10
  @skills[Course.find(77)] = 10
  @skills[Course.find(78)] = 10
  @skills[Course.find(79)] = 10
  @skills[Course.find(80)] = 10
  @skills[Course.find(81)] = 10
  @skills[Course.find(82)] = 10
  @skills[Course.find(83)] = 10
  @skills[Course.find(84)] = 10
  @skills[Course.find(85)] = 10
  @skills[Course.find(86)] = 10
  @skills[Course.find(87)] = 10
  @skills[Course.find(88)] = 10
  @skills[Course.find(89)] = 10
  @skills[Course.find(90)] = 10
end

end #end of class