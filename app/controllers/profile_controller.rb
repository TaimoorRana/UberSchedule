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
    @previous_preferences.exists?(16) ? @entry = 'Fall Entry' : @entry = 'Winter Entry'
    @previous_preferences.exists?(15) ? @coop = 'Yes' : @noLoyolaCampus = 'No'
    @previous_preferences.exists?(14) ? @allowSummerSemester = 'Yes' : @allowSummerSemester = 'No'

    @opt_none = Sequence.find(9).sequence_name
    @opt_gaming = Sequence.find(6).sequence_name
    @opt_web = Sequence.find(7).sequence_name
    @opt_avionics = Sequence.find(8).sequence_name
    @current_opt = student.option

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

    @modified = Array.new

    @previous_minor = student.option
    if @previous_minor != params[:option]
      student.update_attribute(:option, params[:option])
      @modified.push("Changed minor to #{params[:option]}")
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
      @modified.push("No Monday AM allowed")
    end
    if noMondayPm == 1 and !@previous_preferences.exists?(2)
      student.preferences << Preference.where(preference: "noMondayPm").first
      @modified.push("No Monday PM allowed")
    end
    if noTuesdayAm == 1 and !@previous_preferences.exists?(3)
      student.preferences << Preference.where(preference: "noTuesdayAm").first
      @modified.push("No Tuesday AM allowed")
    end
    if noTuesdayPm == 1 and !@previous_preferences.exists?(4)
      student.preferences << Preference.where(preference: "noTuesdayPm").first
      @modified.push("No Tuesday PM allowed")
    end
    if noWednesdayAm == 1 and !@previous_preferences.exists?(5)
      student.preferences << Preference.where(preference: "noWednesdayAm").first
      @modified.push("No Wednesday AM allowed")
    end
    if noWednesdayPm == 1 and !@previous_preferences.exists?(6)
      student.preferences << Preference.where(preference: "noWednesdayPm").first
      @modified.push("No Wednesday PM allowed")
    end
    if noThursdayAm == 1 and !@previous_preferences.exists?(7)
      student.preferences << Preference.where(preference: "noThursdayAm").first
      @modified.push("No Thursday AM allowed")
    end
    if noThursdayPm == 1 and !@previous_preferences.exists?(8)
      student.preferences << Preference.where(preference: "noThursdayPm").first
      @modified.push("No Thursday PM allowed")
    end
    if noFridayAm == 1 and !@previous_preferences.exists?(9)
      student.preferences << Preference.where(preference: "noFridayAm").first
      @modified.push("No Friday AM allowed")
    end
    if noFridayPm == 1 and !@previous_preferences.exists?(10)
      student.preferences << Preference.where(preference: "noFridayPm").first
      @modified.push("No Friday AM allowed")
    end
    if params[:noSplitClasses] == "No" and !@previous_preferences.exists?(11)
      student.preferences << Preference.where(preference: "noSplitClasses").first
      @modified.push("No split classes allowed")
    end
    if params[:noLoyolaCampus] == "No" and !@previous_preferences.exists?(12)
      student.preferences << Preference.where(preference: "noLoyolaCampus").first
      @modified.push("No classes at the Loyola campus allowed")
    end
    if params[:coop] == "Yes" and !@previous_preferences.exists?(15)
      student.preferences << Preference.where(preference: "coop").first
      @modified.push("Part of the COOP program")
    end
    if params[:allowSummerSemester] == "Yes" and !@previous_preferences.exists?(14)
      student.preferences << Preference.where(preference: "allowSummerSemester").first
      @modified.push("Allow Summer classes")
    end
    if params[:entry] == "Fall Entry" and !@previous_preferences.exists?(16)
      student.preferences << Preference.where(preference: "fallEntry").first
      @modified.push("Fall Entry")
    end



    if noMondayAm == 0 and @previous_preferences.exists?(1)
      student.preferences.destroy((Preference.where(preference: "noMondayAm").first).id)
      @modified.push("Monday AM allowed")
    end
    if noMondayPm == 0 and @previous_preferences.exists?(2)
      student.preferences.destroy((Preference.where(preference: "noMondayPm").first).id)
      @modified.push("Monday PM allowed")
    end
    if noTuesdayAm == 0 and @previous_preferences.exists?(3)
      student.preferences.destroy((Preference.where(preference: "noTuesdayAm").first).id)
      @modified.push("Tuesday AM allowed")
    end
    if noTuesdayPm == 0 and @previous_preferences.exists?(4)
      student.preferences.destroy((Preference.where(preference: "noTuesdayPm").first).id)
      @modified.push("Tuesday PM allowed")
    end
    if noWednesdayAm == 0 and @previous_preferences.exists?(5)
      student.preferences.destroy((Preference.where(preference: "noWednesdayAm").first).id)
      @modified.push("Wednesday AM allowed")
    end
    if noWednesdayPm == 0 and @previous_preferences.exists?(6)
      student.preferences.destroy((Preference.where(preference: "noWednesdayPm").first).id)
      @modified.push("Wednesday PM allowed")
    end
    if noThursdayAm == 0 and @previous_preferences.exists?(7)
      student.preferences.destroy((Preference.where(preference: "noThursdayAm").first).id)
      @modified.push("Thursday AM allowed")
    end
    if noThursdayPm == 0 and @previous_preferences.exists?(8)
      student.preferences.destroy((Preference.where(preference: "noThursdayPm").first).id)
      @modified.push("Thursday PM allowed")
    end
    if noFridayAm == 0 and @previous_preferences.exists?(9)
      student.preferences.destroy((Preference.where(preference: "noFridayAm").first).id)
      @modified.push("Friday AM allowed")
    end
    if noFridayPm == 0 and @previous_preferences.exists?(10)
      student.preferences.destroy((Preference.where(preference: "noFridayPm").first).id)
      @modified.push("Friday PM allowed")
    end
    if params[:noSplitClasses] == "Yes" and @previous_preferences.exists?(11)
      student.preferences.destroy((Preference.where(preference: "noSplitClasses").first).id)
      @modified.push("Split classes allowed")
    end
    if params[:noLoyolaCampus] == "Yes" and @previous_preferences.exists?(12)
      student.preferences.destroy((Preference.where(preference: "noLoyolaCampus").first).id)
      @modified.push("Classes at the Loyola campus allowed.")
    end
    if params[:coop] == "No" and @previous_preferences.exists?(15)
      student.preferences.destroy((Preference.where(preference: "coop").first).id)
      @modified.push("Not part of the COOP program")
    end
    if params[:allowSummerSemester] == "No" and @previous_preferences.exists?(14)
      student.preferences.destroy((Preference.where(preference: "allowSummerSemester").first).id)
      @modified.push("Do not allow Summer classes")
    end
    if params[:entry] == "Winter Entry" and @previous_preferences.exists?(16)
      student.preferences.destroy((Preference.where(preference: "fallEntry").first).id)
      @modified.push("Winter Entry")
    end
    

  end

end

