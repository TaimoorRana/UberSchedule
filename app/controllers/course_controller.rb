class CourseController < ApplicationController
 before_action :confirm_logged_in
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])

  end
end
