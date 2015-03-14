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

    mondayAM = params[:mondayAm]
    mondayPM = params[:mondayPm]
    tuedayAM = params[:tuesdayAm]
    tuedayPM = params[:tuesdayPm]
    wednesdayAM = params[:wednesdayAm]
    wednesdayPM = params[:wednesdayPm]
    thursdayAM = params[:thursdayAm]
    thursdayPM = params[:thursdayPm]
    fridayAM = params[:fridayAm]
    fridayPM = params[:fridayPm]

    name = $authorized_student.firstname
    id = $authorized_student.id



    flash[:notice] = "mondayAM = #{mondayAM}"


  end
end
