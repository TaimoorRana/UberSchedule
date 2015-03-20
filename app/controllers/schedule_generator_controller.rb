class ScheduleGeneratorController < ApplicationController
  layout 'general_schedule'

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

    previous_id = 0
    @term_sections.each do |section|
      course_id = section.course_id
      if course_id != previous_id
        course_dept = Course.find(course_id).dept
        course_number = Course.find(course_id).number.to_s
        course = course_dept + " " + course_number
        @courses.push(course)
        previous_id = course_id
      end
    end
  end

  end