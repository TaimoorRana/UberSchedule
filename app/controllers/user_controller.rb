class UserController < ApplicationController
  def add_course
    course = Course.find(params[:id])
    $authorized_user.courses << course
    flash[:notice] = "#{course.name} was added"
    redirect_to controller: 'course',action: 'index'
  end
end
