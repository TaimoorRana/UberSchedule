class CoursesController < ApplicationController
  layout false
  def index
    @courses = Course.all
  end

  def show
  end
end
