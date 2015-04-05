class ScheduleGeneratorController < ApplicationController
  layout 'application'
  before_action :authenticate_user!

  def schedule_generator
    user_id = current_user.user_id
    student = Student.where(user_id: user_id).first
    @student_first_name = student.first_name
    @student_last_name = student.last_name
  end

  def step_two
    @schedule_term = params[:schedule_term]
    @schedule_year = params[:schedule_year]

    user_id = current_user.user_id
    student = Student.where(user_id: user_id).first
    @student_first_name = student.first_name
    @student_last_name = student.last_name

    @term_sections = Section.where(term: @schedule_term).all
    @courses = Array.new
    @courses.push("--None--")
    @completed_courses = student.courses.all

    previous_id = 0
    @term_sections.each do |section|
      course_id = section.course_id
      if (course_id != previous_id) and !@completed_courses.exists?(course_id)
        missing_prereq = 0
        course = Course.find(course_id)
        course_prereqs = course.courses_prereqs.all
        # check if course has prereqs
        # if prereqs, check if prereqs are completed
        if course_prereqs[0] !=nil
          course_prereqs.each do |prereq|
            if !@completed_courses.exists?(prereq.course_id_prereq)
              missing_prereq = 1
              break
            end #if
          end #do
        end
        if missing_prereq == 0
          course_dept = course.dept
          course_number = course.number.to_s
          course_display = course_dept + " " + course_number
          @courses.push(course_display)
          previous_id = course_id
        end
      end
    end #do
  end

  end