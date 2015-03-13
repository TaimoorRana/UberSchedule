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

    flash[:notice] = "loyola = #{loyola}, split = #{split}, major = #{major}, status = #{status}"
  end
end
