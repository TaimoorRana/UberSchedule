class StudentController < ApplicationController

  def add_course
    #find the course in the database
    course = Course.find(params[:id])
    #append this course to the student's course list
    #student = Student.where(user_id: session[:user_id]).first
    current_user.student.courses << course
    flash[:notice] = "#{course.name} was added"
    redirect_to controller: 'course',action: 'index'
  end

  def remove_course
    #find this course in the student's course list
    course = current_user.student.courses.find(course_id: params[:id])
    #delete this course
    current_user.student.courses.delete(course)
    redirect_to controller: 'schedule', action: 'schedule'
  end
end
