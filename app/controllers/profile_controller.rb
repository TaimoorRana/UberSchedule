class ProfileController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!
  def profile
    user_id = current_user.user_id
    student = Student.where(user_id: user_id).first
    @student_first_name = student.first_name
    @student_last_name = student.last_name
    @previous_preferences = student.preferences
    @previous_preferences.exists?(11) ? @noSplitClasses = 'No' : @noSplitClasses = 'Yes'
    @previous_preferences.exists?(12) ? @noLoyolaCampus = 'No' : @noLoyolaCampus = 'Yes'
  end

  def updateProfile

    #user_id = $authorized_user.user_id
    user_id = current_user.user_id
    student = Student.where(user_id: user_id).first
    @previous_preferences = student.preferences
    prev_pref = Array.new
    @previous_preferences.each do |pref|
      prev_pref.push(pref)
    end

    params[:noMondayAm] == "1" ? noMondayAm = 1 : noMondayAm = 0
    params[:noMondayPm] == "1" ? noMondayPm = 1 : noMondayPm = 0
    params[:noTuesdayAm] == "1" ? noTuesdayAm = 1 : noTuesdayAm = 0
    params[:noTuesdayPm] == "1" ? noTuesdayPm = 1 : noTuesdayPm = 0
    params[:noWednesdayAm] == "1" ? noWednesdayAm = 1 : noWednesdayAm = 0
    params[:noWednesdayPm] == "1" ? noWednesdayPm = 1 : noWednesdayPm = 0
    params[:noThursdayAm] == "1" ? noThursdayAm = 1 : noThursdayAm = 0
    params[:noThursdayPm] == "1" ? noThursdayPm = 1 : noThursdayPm = 0
    params[:noFridayAm] == "1" ? noFridayAm = 1 : noFridayAm = 0
    params[:noFridayPm] == "1" ? noFridayPm = 1 : noFridayPm = 0

    if noMondayAm == 1 and !@previous_preferences.exists?(1)
      student.preferences << Preference.where(preference: "noMondayAm").first
    end
    if noMondayPm == 1 and !@previous_preferences.exists?(2)
      student.preferences << Preference.where(preference: "noMondayPm").first
    end
    if noTuesdayAm == 1 and !@previous_preferences.exists?(3)
      student.preferences << Preference.where(preference: "noTuesdayAm").first
    end
    if noTuesdayPm == 1 and !@previous_preferences.exists?(4)
      student.preferences << Preference.where(preference: "noTuesdayPm").first
    end
    if noWednesdayAm == 1 and !@previous_preferences.exists?(5)
      student.preferences << Preference.where(preference: "noWednesdayAm").first
    end
    if noWednesdayPm == 1 and !@previous_preferences.exists?(6)
      student.preferences << Preference.where(preference: "noWednesdayPm").first
    end
    if noThursdayAm == 1 and !@previous_preferences.exists?(7)
      student.preferences << Preference.where(preference: "noThursdayAm").first
    end
    if noThursdayPm == 1 and !@previous_preferences.exists?(8)
      student.preferences << Preference.where(preference: "noThursdayPm").first
    end
    if noFridayAm == 1 and !@previous_preferences.exists?(9)
      student.preferences << Preference.where(preference: "noFridayAm").first
    end
    if noFridayPm == 1 and !@previous_preferences.exists?(10)
      student.preferences << Preference.where(preference: "noFridayPm").first
    end
    if params[:noSplitClasses] == "Yes" and !@previous_preferences.exists?(11)
      student.preferences << Preference.where(preference: "noSplitClasses").first
    end
    if params[:noLoyolaCampus] == "Yes" and !@previous_preferences.exists?(12)
      student.preferences << Preference.where(preference: "noLoyolaCampus").first
    end


    if noMondayAm == 0 and @previous_preferences.exists?(1)
      student.preferences.destroy((Preference.where(preference: "noMondayAm").first).id)
    end
    if noMondayPm == 0 and @previous_preferences.exists?(2)
      student.preferences.destroy((Preference.where(preference: "noMondayPm").first).id)
    end
    if noTuesdayAm == 0 and @previous_preferences.exists?(3)
      student.preferences.destroy((Preference.where(preference: "noTuesdayAm").first).id)
    end
    if noTuesdayPm == 0 and @previous_preferences.exists?(4)
      student.preferences.destroy((Preference.where(preference: "noTuesdayPm").first).id)
    end
    if noWednesdayAm == 0 and @previous_preferences.exists?(5)
      student.preferences.destroy((Preference.where(preference: "noWednesdayAm").first).id)
    end
    if noWednesdayPm == 0 and @previous_preferences.exists?(6)
      student.preferences.destroy((Preference.where(preference: "noWednesdayPm").first).id)
    end
    if noThursdayAm == 0 and @previous_preferences.exists?(7)
      student.preferences.destroy((Preference.where(preference: "noThursdayAm").first).id)
    end
    if noThursdayPm == 0 and @previous_preferences.exists?(8)
      student.preferences.destroy((Preference.where(preference: "noThursdayPm").first).id)
    end
    if noFridayAm == 0 and @previous_preferences.exists?(9)
      student.preferences.destroy((Preference.where(preference: "noFridayAm").first).id)
    end
    if noFridayPm == 0 and @previous_preferences.exists?(10)
      student.preferences.destroy((Preference.where(preference: "noFridayPm").first).id)
    end
    if params[:noSplitClasses] == "No" and @previous_preferences.exists?(11)
      student.preferences.destroy((Preference.where(preference: "noSplitClasses").first).id)
    end
    if params[:noLoyolaCampus] == "No" and @previous_preferences.exists?(12)
      student.preferences.destroy((Preference.where(preference: "noLoyolaCampus").first).id)
    end

  end

end

