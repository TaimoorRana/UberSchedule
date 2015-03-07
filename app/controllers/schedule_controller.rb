class ScheduleController < ApplicationController
  layout 'general_schedule'
 before_action :confirm_logged_in
  def schedule
    @courses = Course.all
  end
end
