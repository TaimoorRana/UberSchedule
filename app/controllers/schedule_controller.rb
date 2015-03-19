class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!

  def schedule
    comp352 = Course.new(dept:"ENGR",number:"352",credit:1.5,name:"Data Structures and Algorithms")
    comp352.sections << Section.new(name:"AA",time_start:"16:00",time_end:"18:15")
    comp352.sections << Section.new(name:"AB",time_start:"10:00",time_end:"12:15")

      @mondaySections = comp352.sections
      @tuesdayCourses = [1,7]
      @wednesdayCourses = []
      @thursdayCourses = [1,3,8]
      @fridayCourses = [6]
  end

  def registered_courses
    #find courses the are linked to this student
   # @courses = Course.where(user_id: $authorized_user.user_id)
    #@student = $authorized_student
    #@allStudents = Student.all
    @courses = current_user.student.courses
    @totalCredits = 0

    @courses.each do |course|
      @totalCredits += course.credit
    end

  end
end
