class CoursesController < ApplicationController
  layout false
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])

  end
end
