class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!

  def schedule
      @mondayCourses = [2,5,7,9]
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
