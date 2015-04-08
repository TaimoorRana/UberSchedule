class CourseController < ApplicationController
  layout 'application'
 before_action :authenticate_user!
  
  def index
    @courses = Course.page(1)
    unless params[:page].nil?
      number = params[:page].to_i
      @courses = Course.page(number)
    end
    if params[:search]
      @courses = Course.search(params[:search]).page
    end
  end

  def show
    @course = Course.find(params[:id])

  end

  def find_courses

  end


end
