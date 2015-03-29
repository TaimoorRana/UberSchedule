class SequenceBuilderController < ApplicationController
  layout 'general_schedule'

  def sequence_builder
    @log = Logger.new("C:\\Users\\Rich\\RubymineProjects\\UberSchedule\\log.txt")
    @log.level = Logger::DEBUG
    user_id = current_user.user_id
    @student = Student.where(user_id: user_id).first

    preferences = @student.preferences
    preferences.exists?(16) ? @semester_counter = 0 : @semester_counter = 1 # 0 = Fall Entry, 1 = Winter Entry
    preferences.exists?(14) ? allowSummer = true : allowSummer = false #not implemented
    preferences.exists?(15) ? coop = 1 : coop = 0 #not implemented

    accumulated_credits = 0 #TODO
    max_credits = 100
    year = 2015
    semester = {0 => "Fall", 1 => "Winter", 2 => "Summer"}

    @all_sections = Array.new
    sections_to_array

    @all_fall_sections = Array.new
    @all_summer_sections = Array.new
    @all_winter_sections = Array.new
    sort_sections_by_term

    @fall_courses_only = Array.new
    @winter_courses_only = Array.new
    @courses_offered_in_summer = Array.new
    courses_given_in_specific_semester

    @all_prereqs = Array.new
    all_prereqs_to_array

    @completed_courses = Array.new
    completed_courses_to_array

    @number_of_direct_dependents = Array.new
    number_of_direct_dependents

  end #end of def sequence_builder

  # populates the @all_sections array with Section objects
  def sections_to_array #tested for class type Array and correct output
    Section.all.each do |section|
      @all_sections.push(section)
    end
  end

  # Filters the Section objects from @all_sections array into small array, according to term
  def sort_sections_by_term #tested for class type Array and proper sort
    @all_sections.each do |section|
      if section.term == "Fall"
        @all_fall_sections.push(section)
      elsif section.term == "Winter"
        @all_winter_sections.push(section)
      elsif section.term = "Summer"
        @all_summer_sections.push(section)
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
        if offered_in_summer
          @courses_offered_in_summer.push(Course.find(current_course_id))
        else
          if offered_in_fall and !offered_in_winter
            @fall_courses_only.push(Course.find(current_course_id))
            @log.info("added a fall only course")
          end
          if !offered_in_fall and offered_in_winter
            @winter_courses_only.push(Course.find(current_course_id))
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
    end
  end

  # populates @complete_courses with the Courses from @student.courses
  # subsequently used to store Courses added to sequence
  def completed_courses_to_array #teted for array type and proper content
    @student.courses.each do |course|
      @completed_courses.push(course)
    end
  end

  # Stored the number of direct dependents for a given Course.
  # The index of the array corresponds to the course_id of the Course.
  def number_of_direct_dependents #tested for array Type and proper content
    Course.all.each do |course|
      @number_of_direct_dependents[course.course_id] =
          CoursesPrereq.where(course_id_prereq: course.course_id).count
    end
  end

end #end of class