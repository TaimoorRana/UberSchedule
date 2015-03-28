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
    fall_sections = Section.where(term: "Fall")
    winter_sections = Section.where(term: "Winter")
    summer_sections = Section.where(term: "Summer")
    semester_section = {"Fall" => fall_sections, "Winter" => winter_sections, "Summer" => summer_sections}
    completed_courses = student.courses
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
          course = Course.find(course_id) ###---deleted by Adrian
          previous_course_id = Course.find(course_id)#TODO DB CALL TO BE REMOVED
          if !completed_courses.include?(course) #if course not completed
          missing_prereq = 0
          course_prereqs = CoursesPrereq.where(course_id: course_id)
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
        semester_classes = (current_semester == "Summer") ? 4 : 5
        used_index = Array.new
        #Add classes from available classes until max_classes is reached
        #increment credits
        #add added course to db of completed courses
        available_length = available_this_semester.length
        max_classes = [semester_classes, available_length].min
        if available_length != 0
        until classes_counter == max_classes do
          random_index = rand(available_length)
          if !(used_index.include? random_index)
            used_index.push(random_index)
            added_course = available_this_semester[random_index]
            @current_semester.push(added_course)
            classes_counter =  classes_counter + 1
            accumulated_credits = accumulated_credits + 3
            completed_courses.push(added_course) #TODO Remember to push this to DB after job done
          end
        end #end of until classes_counter > max_classes
        @complete_sequence.push(@current_semester)
        @semester_counter = @semester_counter + 1
      end
      end
      end
  end



