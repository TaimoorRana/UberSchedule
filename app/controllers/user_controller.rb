class UserController < ApplicationController
  def add_course
    #find the course in the database
    course = Course.find(params[:id])
    #append this course to the user's course list
    $authorized_user.courses << course
    flash[:notice] = "#{course.name} was added"
    redirect_to controller: 'course',action: 'index'
  end

  def remove_course
    #find this course in the user's course list
    course = $authorized_user.courses.find(params[:id])
    #delete this course
    $authorized_user.courses.delete(course)
    redirect_to controller: 'schedule', action: 'schedule'
  end
end
