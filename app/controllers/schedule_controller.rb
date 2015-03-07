class ScheduleController < ApplicationController
 before_action :confirm_logged_in
  def schedule
    @courses = Course.all
  end
end
