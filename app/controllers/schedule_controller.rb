class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :confirm_logged_in

  def schedule
    #find courses the are linked to this user
   # @courses = Course.where(user_id: $authorized_user.user_id)
    #@student = $authorized_student
  end
end
