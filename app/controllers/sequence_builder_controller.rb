class SequenceBuilderController < ApplicationController
  layout 'general_schedule'

  def sequence_builder
    @log = Logger.new("C:\\Users\\Rich\\RubymineProjects\\UberSchedule\\log.txt")
    @log.level = Logger::DEBUG
    user_id = current_user.user_id
    @student = Student.where(user_id: user_id).first
    @semester_counter = 0
    preferences = @student.preferences
    preferences.exists?(15) ? @semester_counter = 0 : @semester_counter = 1 # 0 = Fall Entry, 1 = Winter Entry
    preferences.exists?(14) ? allowSummer = true : allowSummer = false #not implemented


    max_credits = 120
    @year = 2015
    @semester = {0 => "Fall", 1 => "Winter", 2 => "Summer"}

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

    @all_prereqs = Array.new
    @all_200_level = Array.new
    @all_400_level = Array.new
    @completed_all_200_level = false
    all_prereqs_to_array
    generate_all_200_and_400_level

    @completed_courses = Array.new
    completed_courses_to_array

    @accumulated_credits = 0
    initial_accumulated_credits

    @number_of_direct_dependents = Array.new
    number_of_direct_dependents

    @complete_sequence = Array.new

    while @accumulated_credits < max_credits
      current_semester = Array.new
      @log.info("========== STARTING TO GENERATE A SEMESTER =============")
      semester_string = determine_current_semester
      @log.info("Semester:" + semester_string)
      current_semester.push(semester_string)
      available_courses = generate_available_courses
      selected_courses = select_courses_from_available(available_courses)

      selected_courses.each do |course|
        current_semester.push(course.dept + " " + course.number.to_s)
        @completed_courses.push(course)
        @accumulated_credits += course.credit
        @log.info("!!!!!!!ADDED " + course.dept + course.number.to_s + " to current semester")
        end
      @complete_sequence.push(current_semester)
      @log.info("-------------pushed current_semester into complete_sequence")
      @accumulated_credits += 1

      if !@completed_all_200_level
        determine_completed_all_200_level
      end
      @semester_counter+=1
     # @log.info("semester_counter: " + @semester_counter.to_s)
    end

  end #end of def sequence_builder

  # populates the @all_sections array with Section objects
  def sections_to_array #tested for class type Array and correct output
    Section.all.each do |section|
      @all_sections.push(section)
      @log.info("@all_sections <= " + section.id.to_s)
    end
  end

  # Filters the Section objects from @all_sections array into small array, according to term
  def sort_sections_by_term #tested for class type Array and proper sort
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

  #populates the @fall_courses_only, @winter_courses_only and @courses_offered_in_summer arrays with Course objects
  def courses_given_in_specific_semester #tested for array types and proper content
    offered_in_fall = false
    offered_in_winter = false
    offered_in_summer = false
    current_course_id = 1
    @all_sections.each do |section|
      if current_course_id != section.course_id
        course = Course.find(current_course_id)
        if offered_in_summer
          @courses_offered_in_summer.push(course)
          @log.info("@courses_offered_in_summer <= " + course.dept + course.number.to_s)
        else
          if offered_in_fall and !offered_in_winter
            @fall_courses_only.push(course)
            @log.info("@fall_courses_only <= " + course.dept + course.number.to_s)
          end
          if !offered_in_fall and offered_in_winter
            @winter_courses_only.push(course)
            @log.info("@winter_courses_only <= " + course.dept + course.number.to_s)
          end
        end
        current_course_id = section.course_id
        offered_in_fall = false
        offered_in_winter = false
        offered_in_summer = false
      end #end if current_course_id != section.course_id
        if section.term == "Fall"
          offered_in_fall = true
        elsif section.term == "Winter"
          offered_in_winter = true
        elsif section.term == "Summer"
          offered_in_summer = true
        end
    end #end do loop
  end #end of courses_given_only_in_fall_or_winter_plus_summer

  # populates @all_prereqs array with CoursesPrereq objects
  def all_prereqs_to_array #tested for array type and proper content
    CoursesPrereq.all.each do |prereq|
      @all_prereqs.push(prereq)
      @log.info("@all_prereqs <= " + prereq.course_id.to_s + " " + prereq.course_id_prereq.to_s)
    end
  end

  # populates @complete_courses with the Courses from @student.courses
  def completed_courses_to_array #teted for array type and proper content
    @student.courses.each do |course|
      @completed_courses.push(course)
      @log.info("@completed_courses <= " + course.dept + course.number.to_s)
    end
  end

  def number_of_direct_dependents #tested for array Type and proper content
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

  def get_prereqs(course)
    arr = Array.new
    @all_prereqs.each do |prereq|
      if (prereq.course_id == course.course_id) and (prereq.course_id != 0)
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

  def determine_current_semester
    current_semester_string = @semester[@semester_counter.modulo(2)]
    if current_semester_string == "Winter"
      @year+=1
    end
    current_year = @year.to_s
    return current_semester_string + " " + current_year
  end

  def generate_available_courses
    available_courses = Array.new
    all_given_sections = @all_given_sections[@semester_counter.modulo(2)]
    previous_course_id = 0
    all_given_sections.each do |section|
      if previous_course_id != section.course_id #prevents double checking Courses
        previous_course_id = section.course_id
        course = Course.find(section.course_id)
        if !@completed_courses.include?(course) #check if course was taken
          missing_prereqs = false
          if @all_400_level.include?(course)
            missing_prereqs = !@completed_all_200_level
            log_string = missing_prereqs ? "true" : "false"
            @log.info("400-400-400 check if 400 is missing 200 level: " + log_string)
          end
          if @number_of_direct_dependents[section.course_id] > 0 and missing_prereqs == false
            prereqs = get_prereqs(course)
            prereqs.each do |p|
             if !@completed_courses.include?(Course.find(p.course_id_prereq))
               missing_prereqs = true
             end
             end
          end #if has prereq
          if !missing_prereqs
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
    Course.all.each do |x|
      if x.number > 200 and x.number < 300 and x.number != 242 and x.number != 243 and x.number != 244 and x.number != 245 and x.dept != "ENCS"
        @all_200_level.push(x)
        @log.info("all_200_level <=" + x.dept + x.number.to_s)
      elsif x.number > 400
        @all_400_level.push(x)
        @log.info("all_400_level <=" + x.dept + x.number.to_s)
      end
      end
  end

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

  def select_courses_from_available(available)
    selected = Array.new
    filter1 = Array.new
    filter2 = Array.new
    filter3 = Array.new

    if @semester[@semester_counter.modulo(2)] == "Fall"
       courses_given_this_term_only = @fall_courses_only
    elsif @semester[@semester_counter.modulo(2)] == "Winter"
        courses_given_this_term_only = @winter_courses_only
    end
    @log.info("Semest in selection algo:" + @semester[@semester_counter.modulo(2)])

    available.each do |avail|
      @log.info("Now checking the priority of " + avail.dept + avail.number.to_s )
      @log.info("It has " + @number_of_direct_dependents[avail.course_id].to_s + " dependents.")
       if courses_given_this_term_only.include?(available) and @number_of_direct_dependents[avail.course_id] > 0 and (avail.dept == "COMP" or avail.dept == "SOEN")
         filter1.push(avail)
         @log.info("added " + avail.dept + avail.number.to_s + "to filter1")
         available.delete(avail)
       elsif (avail.dept == "COMP" or avail.dept == "SOEN") and @number_of_direct_dependents[avail.course_id] > 0
         filter1.push(avail)
         @log.info("added " + avail.dept + avail.number.to_s + "to filter1")
         available.delete(avail)
       end
    end
    if filter1.size < 5
      available.each do |avail|
        if @number_of_direct_dependents[avail.course_id] > 0
          filter2.push(avail)
          @log.info("added " + avail.dept + avail.number.to_s + "to filter2")
          available.delete(avail)
        end
      end
    end
    if (filter1.size + filter2.size) < 5
      available.each do |avail|
       if courses_given_this_term_only.include?(avail) and !@courses_offered_in_summer.include?(avail)
         filter3.push(avail)
         @log.info("added " + avail.dept + avail.number.to_s + "to filter3")
         available.delete(avail)
       end
      end
    end
  if filter1.size > 4
    @log.info("Filter1.size is greater than 4")
    selected[0] = filter1[0]
    selected[1] = filter1[1]
    selected[2] = filter1[2]
    selected[3] = filter1[3]
    selected[4] = filter1[4]
  else
    @log.info("Filter1.size is less than 4")
    course_counter = 0
    max_course = [5, available.length].min
    while course_counter <= filter1.size - 1
      selected.push(filter1[course_counter])
      @log.info("SELECTED " + filter1[course_counter].dept + filter1[course_counter].number.to_s)
      course_counter += 1
      @log.info("course_counter:" + course_counter.to_s)
    end
    while course_counter < max_course do
      if filter2[0] != nil
        if !selected.include?(filter2[0])
          selected.push(filter2[0])
         @log.info("SELECTED " + filter2[0].dept + filter2[0].number.to_s)
          filter2.delete(filter2[0])
          course_counter += 1
          @log.info("course_counter:" + course_counter.to_s)
        end
      elsif filter3[0] != nil
        if !selected.include?(filter3[0])
         selected.push(filter3[0])
        @log.info("SELECTED " + filter3[0].dept + filter3[0].number.to_s)
         filter3.delete(filter3[0])
         course_counter += 1
         @log.info("course_counter:" + course_counter.to_s)
        end
      elsif available[0] != nil
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
    selected.each do |x|
      @log.info("*****result of selection:"  + x.dept + x.number.to_s)
    end
    return selected
  end #END OF SELECT
end #end of class