class ScheduleController < ApplicationController
  layout 'general_schedule'
 before_action :confirm_logged_in
  def schedule
    @courses = Course.where(user_id: $authorized_user.id)
  end
end
