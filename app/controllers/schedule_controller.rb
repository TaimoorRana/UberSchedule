class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :confirm_logged_in

  def schedule
    #find courses the are linked to this student
   # @courses = Course.where(user_id: $authorized_user.user_id)
    #@student = $authorized_student
    #@allStudents = Student.all
    student = Student.where(firstname: 'taimoor');
    @courses = $authorized_student.courses
    @totalCredits = 0

    @courses.each do |course|
      @totalCredits += course.credit
    end

  end
end
