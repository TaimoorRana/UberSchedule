class SequenceBuilderController < ApplicationController
  layout 'application'

  def sequence_builder
    @log = Logger.new("log3.txt")  #Logger Class instance used to debug
    @log.level = Logger::DEBUG     #all lines starting with @log.info are just there to log shit.

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
    generate_mandatory_courses

    @all_prereqs = Array.new
    @all_coreqs = Array.new #TODO not yet used! Creates problems mainly for COMP390
    @all_200_level = Array.new
    @all_400_level = Array.new
    @completed_all_200_level = false #later checked via determine_completed_all_200_level method
    all_prereqs_to_array
    generate_all_200_and_400_level

    @completed_courses = Array.new
    completed_courses_to_array

    @accumulated_credits = 0
    initial_accumulated_credits

    @number_of_direct_dependents = Array.new
    number_of_direct_dependents

    @all_basic_sciences = Array.new
    @basic_science_counter = 0
    @ignore_list = Array.new
    @all_options = Array.new
    generate_basic_sciences
    generate_ignore_list

    test = list_of_dependents(Course.find(15)) #Testing the list_of_dependents method. Only for logging purposes.
    @log.info("+++CONTENTS OF list_of_dependents")
    test.each do |x|
      @log.info(x)
    end

    @complete_sequence = Array.new # Will be populated by current_semester Arrays detailed in the upcoming while loop.

    # This while loop will control the creation of the entire sequence. The end result is a fully generated sequence
    # stored in @complete_sequence.
    while @accumulated_credits < max_credits
      current_semester = Array.new #will contain STRINGS following the order: [semester detail] [Courses dept + Number] [accumulated credits]

      @log.info("========== STARTING TO GENERATE A SEMESTER =============")
      semester_string = determine_current_semester
      @log.info("Semester:" + semester_string)

      current_semester.push(semester_string) #  push semester detail for display purposes
      available_courses = generate_available_courses #  available course = {course not yet taken} - {course that don't meet prereqs}
      selected_courses = select_courses_from_available(available_courses) # from available courses, select the ones with highest priority

      selected_courses.each do |course| # pushes string form of selected courses to the current_semester array.
        current_semester.push(course.dept + " " + course.number.to_s)
        @completed_courses.push(course)
        @accumulated_credits += course.credit
        @log.info("!!! ADDED " + course.dept + course.number.to_s + " to current semester")
        end
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
      @log.info("@all_sections <= " + section.id.to_s)
    end
  end

  # Separates by term the @all_sections array into smaller arrays.
  # Used to limit the operations in the generate_available_course method and to ensure that a course not given in a
  # semester doesn't appear to be available for that semester.
  def sort_sections_by_term
    @all_sections.each do |section|
      if section.term == "Fall"
        @all_fall_sections.push(section)
        @log.info("@all_fall_sections <= " + section.id.to_s)
      elsif section.term == "Winter"
        @all_winter_sections.push(section)
        @log.info("@all_winter_sections <= " + section.id.to_s)
      elsif section.term = "Summer"
        @all_summer_sections.push(section)
        @log.info("@all_summer_sections <= " + section.id.to_s)
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
        if offered_in_summer #  the offered_ booleans correspond to the previous course! See **REF** to see where they are declared
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
      @log.info("@all_coreqs <= " + prereq.course_id.to_s + " " + prereq.course_id_prereq.to_s)
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

  # OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE OBSOLETE
  # Replaced by methods which return the entire list of dependents for a course!
  # Will delete once the new better method is fully implemented
  def number_of_direct_dependents
    Course.all.each do |course|
        arr = Array.new
        @all_prereqs.each do |prereq|
          if(prereq.course_id_prereq == course.course_id) and (prereq.course_id != 0)
            arr.push(prereq)
          end
        end
        @number_of_direct_dependents[course.course_id] = arr.size
      @log.info("# of direct dependents of " + course.dept + course.number.to_s + " is " + arr.size.to_s)
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
    all_given_sections = @all_given_sections[@semester_counter.modulo(@semester_modulo)]  # find all sections given in a term
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
          if CoursesPrereq.where(course_id: course).size > 0 and missing_prereqs == false #if course has prereqs and hasn't failed yet.
            prereqs = get_prereqs(course)
            prereqs.each do |p|
             if !@completed_courses.include?(Course.find(p.course_id_prereq)) #too lazy to prevent this DB call
               missing_prereqs = true
             end
            end
          end #if has prereq
          if !missing_prereqs and basic_sciences_allowed # if no missing prereqs and not an invalid basic science, push to available.
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
    Course.all.each do |x| #  lazy way to exclude electives. Was made before implementation of @mandatory_courses
      if x.number > 200 and x.number < 300 and x.number != 242 and x.number != 243 and x.number != 244 and x.number != 245 and x.dept != "ENCS"
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
  end

  def generate_ignore_list #courses that are in the DB but should never be taken
    @ignore_list.push(Course.find(7)) #ENGR244 is not a basic science
    @ignore_list.push(Course.find(8)) #ENGR245 is not a basic science
    @ignore_list.push(Course.find(39)) #COMP490
    @ignore_list.push(Course.find(40)) #COMP492
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
  end

  # ---MAJOR METHOD---
  # The brains of our application! Note, this is currently a placeholder, so I won't comment the code too much.
  # The current code is pretty much a half-assed attempt to get something working. It works by arbitrarily dividing
  # the available courses into 4 categories and picking the highest 4/5 for a given semester. It has many flaws which
  # must be fixed in the next version. See the TODO
  # This is what the priority should ideally look like (assume current semester is not Summer):
  # 1 -  Courses given only in current term + highest relative number of dependents + is not an elective (ex: SOEN 228)
  # 2 -  Courses with highest relative number of dependents + is not elective (basically only COMP 352)
  # 3 -  Courses given only in the current term + medium dependents + is not an elective (ex: SOEN 343)
  # 4 -  Courses with high relative number of dependents + is not elective + not offered in the summer (ex: SOEN 341?)
  # 5 -  Courses with medium relative number of dependents + is not elective
  # 6 -  Courses with high relative number of dependents
  # 7 -  Whatever is left.
  # TODO 1: Replace @number_of_direct_dependents by the information for the complete set of dependents. This alone will generate awesome schedules.
  # TODO 2: Deal with prereq_type_id 3 (coreqs), most notably SOEN390.
  # TODO 3: When basic science is selected, increment @basic_science_counter. Prevent that counter to reach 3.
  # TODO 4: Just generally find a less ugly way to do this part :)
  # TODO 5: Stop adding courses once the @accumulated_credits reach 120.
  # TODO 6: ALLOW SOEN490. It requires special logic due to its unique nature and unique DB entry.
  def select_courses_from_available(available)
    selected = Array.new
    filter1 = Array.new
    filter2 = Array.new
    filter3 = Array.new

    if @semester[@semester_counter.modulo(@semester_modulo)] == "Fall"
       courses_given_this_term_only = @fall_courses_only
    elsif @semester[@semester_counter.modulo(@semester_modulo)] == "Winter"
        courses_given_this_term_only = @winter_courses_only
    elsif @semester[@semester_counter.modulo(@semester_modulo)] == "Summer"
      courses_given_this_term_only = @courses_offered_in_summer
    end

    max_courses = (@semester[@semester_counter.modulo(@semester_modulo)] == "Summer") ? 4 : 5

    available.each do |avail| #generate top priority courses
       if courses_given_this_term_only.include?(available) and @number_of_direct_dependents[avail.course_id] > 0 and @mandatory_courses.include?(avail)
         filter1.push(avail)
         @log.info("added " + avail.dept + avail.number.to_s + "to filter1")
         available.delete(avail)
       elsif (avail.dept == "COMP" or avail.dept == "SOEN") and @number_of_direct_dependents[avail.course_id] > 0 and @mandatory_courses.include?(avail)
         filter1.push(avail) and !@courses_offered_in_summer.include?(avail)
         @log.info("added " + avail.dept + avail.number.to_s + "to filter1")
         available.delete(avail)
       end
    end
    if filter1.size < max_courses #generate 2nd priority courses
      available.each do |avail|
        if (@number_of_direct_dependents[avail.course_id] > 0 and (avail.dept == "COMP" or avail.dept == "SOEN")) or @all_200_level.include?(avail)
          filter2.push(avail)
          @log.info("added " + avail.dept + avail.number.to_s + "to filter2")
          available.delete(avail)
        end
      end
    end
    if (filter1.size + filter2.size) < max_courses #generate 3rd priority courses
      available.each do |avail|
       if courses_given_this_term_only.include?(avail) and !@courses_offered_in_summer.include?(avail)
         filter3.push(avail)
         @log.info("added " + avail.dept + avail.number.to_s + "to filter3")
         available.delete(avail)
       end
      end
    end
  if filter1.size > (max_courses - 1) #if many top priority, just pick 5!
    @log.info("Filter1.size is greater than 4")
    selected[0] = filter1[0]
    selected[1] = filter1[1]
    selected[2] = filter1[2]
    selected[3] = filter1[3]
    selected[4] = filter1[4]
  else
    @log.info("Filter1.size is less than 4")
    course_counter = 0
    max_courses = [max_courses, available.length].min
    while course_counter <= filter1.size - 1 #add all top priorities, then move on.
      selected.push(filter1[course_counter])
      @log.info("SELECTED " + filter1[course_counter].dept + filter1[course_counter].number.to_s)
      course_counter += 1
      @log.info("course_counter:" + course_counter.to_s)
    end
    while course_counter < max_courses do #add all 2nd, then move on.
      if filter2[0] != nil
        if !selected.include?(filter2[0])
          selected.push(filter2[0])
         @log.info("SELECTED " + filter2[0].dept + filter2[0].number.to_s)
          filter2.delete(filter2[0])
          course_counter += 1
          @log.info("course_counter:" + course_counter.to_s)
        end
      elsif filter3[0] != nil # add all 3rd, then move on.
        if !selected.include?(filter3[0])
         selected.push(filter3[0])
        @log.info("SELECTED " + filter3[0].dept + filter3[0].number.to_s)
         filter3.delete(filter3[0])
         course_counter += 1
         @log.info("course_counter:" + course_counter.to_s)
        end
      elsif available[0] != nil #add the rest, then return.
        if !selected.include?(available[0])
          selected.push(available[0])
        @log.info("SELECTED " + available[0].dept + available[0].number.to_s)
          available.delete(available[0])
          course_counter += 1
          @log.info("course_counter:" + course_counter.to_s)
        end
      end
    end
  end
    selected.each do |x| #only for logging purposes
      @log.info("*****result of selection:"  + x.dept + x.number.to_s)
    end
    return selected
  end #END OF SELECT

  # The following two methods work in pairs. populate_list is only ever called from within list_of_dependents
  # These functions work recursively to generate the entire list of dependents for any given course.
  def list_of_dependents(course)
    @list_of_dependents = Set.new
    populate_list(course)
    return @list_of_dependents
  end

  def populate_list(c)
    dependents = CoursesPrereq.where(course_id_prereq: c.course_id)
    dependents.each do |d|
      if d != nil
        d_course = Course.find(d.course_id)
        if @mandatory_courses.include?(d_course)
          @log.info("d_course is " + d_course.dept + d_course.number.to_s)
          @list_of_dependents.add(d_course)
          populate_list(d_course)
        end
      end
    end
  end

end #end of class