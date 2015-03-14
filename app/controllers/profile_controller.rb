class ProfileController < ApplicationController
  layout 'general_schedule'
  def profile
    @days = DaysOfWeek.all
  end

  def updateProfile

    (params[:loyola] == "Yes") ? loyola = 1 : loyola = 0
    (params[:split] == "Yes") ? split = 1 : split = 0

    status = params[:status]

    (params[:mondayAm] == nil) ? mondayAM = 0 : mondayAM = 1
    (params[:mondayPm] == nil) ? mondayPM = 0 : mondayPM = 1
    (params[:tuesdayAm] == nil) ? tuesdayAM = 0 : tuesdayAM = 1
    (params[:tuesdayPm] == nil) ? tuesdayPM = 0 : tuesdayPM = 1
    (params[:wednesdayAm] == nil) ? wednesdayAM = 0 : wednesdayAM = 1
    (params[:wednesdayPm] == nil) ? wednesdayPM = 0 : wednesdayPM = 1
    (params[:thursdayAm] == nil) ? thursdayAM = 0 : thursdayAM = 1
    (params[:thursdayPm] == nil) ? thursdayPM = 0 : thursdayPM = 1
    (params[:fridayAm] == nil) ? fridayAM = 0 : fridayAM = 1
    (params[:fridayPm] == nil) ? fridayPM = 0 : fridayPM = 1


    id = $authorized_student.id
    student = Student.find(id)
    preference = student.preference

    preference.update_attribute(:loyola, loyola)
    preference.update_attribute(:status, status)
    preference.update_attribute(:split, split)
    preference.update_attribute(:monday_am, mondayAM)
    preference.update_attribute(:monday_pm, mondayPM)
    preference.update_attribute(:tuesday_am, tuesdayAM)
    preference.update_attribute(:tuesday_pm, tuesdayPM)
    preference.update_attribute(:wednesday_am, wednesdayAM)
    preference.update_attribute(:wednesday_pm, wednesdayPM)
    preference.update_attribute(:thursday_am, thursdayAM)
    preference.update_attribute(:thursday_pm, thursdayPM)
    preference.update_attribute(:friday_am, fridayAM)
    preference.update_attribute(:friday_pm, fridayPM)

  end
end
