class SequenceBuilderController < ApplicationController
  layout 'general_schedule'

  def sequence_builder
    user_id = current_user.user_id
    student = Student.where(user_id: user_id).first
    preferences = student.preferences
    preferences.exists?(16) ? @semester_counter = 0 : @semester_counter = 1
    preferences.exists?(14) ? allowSummer = true : allowSummer = false
    preferences.exists?(15) ? coop = 1 : coop = 0
    year = 2015
    accumulated_credits = 0 #TODO
    max_credits = 120
    semester = {0 => "Fall", 1 => "Winter", 2 => "Summer"}
    all_sections = Section.all
    fall_sections = all_sections.where(term: "Fall")
    winter_sections = all_sections.where(term: "Winter")
    summer_sections = all_sections.where(term: "Summer")
    semester_section = {"Fall" => fall_sections, "Winter" => winter_sections, "Summer" => summer_sections}
    list_of_prereqs = CoursesPrereq.all
    completed_courses = student.courses.all
    @complete_sequence = Array.new

    #Loop until acculmated credits reach 120

    until accumulated_credits > max_credits do
     @current_semester = Array.new
     available_this_semester = Array.new
      classes_counter = 0 #courses counter for this semester: 5 max for winter/fall, 4 for summer
      #modulo = allowSummer ? 3 : 2 #select the proper modulo: 2 for summer, 3 otherwise
      current_semester = semester[(@semester_counter).modulo(2)] #select current_semester
      (current_semester == "Winter") ? year = year + 1 : year = year
      #semester_year = current_semester + " " + year.to_s
      previous_course_id = 0
      semester_section[current_semester].each do |section| #loop through all courses given this semester
        course_id = section.course_id
        if(previous_course_id != course_id)
          course = Course.find(course_id)
          previous_course_id = course_id#TODO DB CALL TO BE REMOVED
          if !completed_courses.include?(course) #if course not completed
          missing_prereq = 0
          course_prereqs = list_of_prereqs.where(course_id: course_id)
          if course_prereqs[0] !=nil #check if course has prereqs
            course_prereqs.each do |prereq| #if yes, check if they have been completed
              if !completed_courses.include?(Course.find(prereq.course_id_prereq))
                missing_prereq = 1
                break
              end #end of most nested id
            end #end of prereqs loop
          end #end of if has prereqs
            if missing_prereq == 0
              available_this_semester.push(course)
            end
          end #end of main if
          end
      end #end of do
        max_classes = (current_semester == "Summer") ? 4 : 5
        used_index = Array.new
        #Add classes from available classes until max_classes is reached
        #increment credits
        #add added course to db of completed courses
        until classes_counter == max_classes do
          available_length = available_this_semester.length
          random_index = rand(available_length)
          if !(used_index.include? random_index)
            used_index.push(random_index)
            added_course = available_this_semester[random_index]
            @current_semester.push(added_course)
            classes_counter =  classes_counter + 1
            accumulated_credits = accumulated_credits + added_course.credit
            completed_courses.push(added_course) #TODO Remember to push this to DB after job done
          end
        end #end of until classes_counter > max_classes
        @complete_sequence.push(@current_semester)
        @semester_counter = @semester_counter + 1
    end
      completed_courses.each do |x|
      student.courses << x
      end

    end


  end


