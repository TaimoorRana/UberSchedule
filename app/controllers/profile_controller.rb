class ProfileController < ApplicationController
  layout 'general_schedule'
  def profile
    @days = DaysOfWeek.all
  end

end
