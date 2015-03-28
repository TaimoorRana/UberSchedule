class SequenceBuilderController < ApplicationController
  layout 'general_schedule'

  def sequence_builder
    user_id = current_user.user_id
    student = Student.where(user_id: user_id).first
    preferences = student.preferences
    preferences.exists?(16) ? @semester_counter = 0 : @semester_counter = 1 # 0 = Fall Entry, 1 = Winter Entry
    preferences.exists?(14) ? allowSummer = true : allowSummer = false #not implemented
    preferences.exists?(15) ? coop = 1 : coop = 0 #not implemented
    year = 2015
    accumulated_credits = 0 #TODO
    max_credits = 30
    semester = {0 => "Fall", 1 => "Winter", 2 => "Summer"}

    all_sections = Section.all
    all_fall_sections = all_sections.where(term: "Fall")
    all_winter_sections = Section.where(term: "Winter")
    all_summer_sections = Section.where(term: "Summer")

    @fall_courses_only = Array.new
    @winter_courses_only = Array.new
    semester_section = {"Fall" => all_fall_sections, "Winter" => all_winter_sections, "Summer" => all_summer_sections}

    #prereqs = CoursesPrereq.all
    @completed_courses = Array.new
    @complete_sequence = Array.new

    #Find courses only given in Fall or Winter
    previous_course_id = 0
    all_sections.each do |section|
      current_course_id = section.course_id
      current_course = Course.find(current_course_id)
      if previous_course_id != current_course_id #prevents double checking for same course
        previous_course_id = current_course_id
        fall_offered = all_fall_sections.exists?(course_id: current_course_id)
        winter_offered = all_winter_sections.exists?(course_id: current_course_id)
        summer_offered = all_summer_sections.exists?(course_id: current_course_id)
        if summer_offered == false
          if fall_offered and !winter_offered
            @fall_courses_only.push(current_course)
          elsif winter_offered and !fall_offered
            @winter_courses_only.push(current_course)
          end
        end #if summer_size == 0
      end
    end # end of do


    #Generate sequence

    while accumulated_credits < max_credits do
     @current_semester = Array.new #array to contain course info for this semester
     #modulo = allowSummer ? 3 : 2 #select the proper modulo: 2 for summer, 3 otherwise
     modulo = 2
     current_semester = semester[(@semester_counter).modulo(modulo)] #select current_semester
     current_semester == "Winter" ? year = year + 1 : year = year
     semester_year = current_semester + " " + year.to_s
     @current_semester.push(semester_year)

     available_this_semester = Array.new
     previous_course_id = 0
     semester_section[current_semester].each do |section| #loop through all courses given this semester
        course_id = section.course_id
        if(previous_course_id != course_id)
          course = Course.find(course_id) ###---deleted by Adrian
          previous_course_id = Course.find(course_id)
          if !@completed_courses.include?(course) #if course not completed
          #missing_prereq = 0
          #course_prereqs = prereqs.where(course_id: course_id)
          #if course_prereqs[0] !=nil #check if course has prereqs
           # course_prereqs.each do |prereq| #if yes, check if they have been completed
            #  if !completed_courses.include?(Course.find(prereq.course_id_prereq))
             #   missing_prereq = 1
              #  break
             # end #end of most nested id
           # end #end of prereqs loop
         # end #end of if has prereqs
          #  if missing_prereq == 0
              available_this_semester.push(course)
          # end
         end #end of main if
          end
      end #end of do
        semester_classes = (current_semester == "Summer") ? 4 : 5
        #Add classes from available classes until max_classes is reached
        #increment credits
        #add added course to db of completed courses
        available_length = available_this_semester.length
        max_classes = [semester_classes, available_length].min
        classes_counter = 0
        if available_length != 0
          while classes_counter < max_classes
          available_this_semester.each do |course|
            if current_semester == "Fall" and @fall_courses_only.include?(course) and classes_counter < max_classes
              @current_semester.push(course_to_string(course))
              @completed_courses.push(course)
              accumulated_credits = accumulated_credits + course.credit
              classes_counter+=1
            elsif current_semester == "Winter" and @winter_courses_only.include?(course) and classes_counter < max_classes
              @current_semester.push(course_to_string(course))
              @completed_courses.push(course)
              accumulated_credits = accumulated_credits + course.credit
              classes_counter+=1
            end
          end
          end
            while classes_counter < max_classes
              available_this_semester.each do |course|
                if !completed_courses.include?(course)
                  @current_semester.push(course_to_string(course))
                  @completed_courses.push(course)
                  accumulated_credits = accumulated_credits + course.credit
                  classes_counter+=1
                  end
              end
            end

        end
       @complete_sequence.push(@current_semester)
       @semester_counter = @semester_counter + 1
        end #end of until classes_counter == max_classes
  end

  def course_to_string(course)
    return course.dept + " " + course.number.to_s
  end

end



