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
    Course.all.each do |course|
      @courses.append("#{course.dept} #{course.number}")
    end
    @completed_courses = student.courses.all


  end

  end