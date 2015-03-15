class CourseController < ApplicationController
  layout 'general_schedule'
# before_action :confirm_logged_in
  
  def index
    @courses = Course.page(1)
    unless params[:page].nil?
      number = params[:page].to_i
      @courses = Course.page(number)
    end
  end

  def show
    @course = Course.find(params[:id])

  end

  def find_courses

  end


end
