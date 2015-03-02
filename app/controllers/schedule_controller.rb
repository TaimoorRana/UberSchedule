class ScheduleController < ApplicationController
  def schedule
    @courses = Course.all
  end
end
