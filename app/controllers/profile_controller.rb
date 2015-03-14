class ProfileController < ApplicationController
  layout 'general_schedule'
  def profile
    @days = DaysOfWeek.all
  end

  def updateProfile
    loyola = params[:loyola]
    split = params[:split]
    major = params[:major]
    status = params[:status]

    name = $authorized_student.student_firstname
    id = $authorized_student.student_id

    flash[:notice] = "please notice me!!! #{name} and id is #{id}"


    flash[:notice] = "loyola = #{loyola}, split = #{split}, major = #{major}, status = #{status}"
  end
end
