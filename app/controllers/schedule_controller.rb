class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!

  def schedule
    # is used for testing and not mess up the Database
    comp352 = Course.new(dept:"ENGR",number:"352",credit:1.5,name:"Data Structures and Algorithms")
    comp352.sections << Section.new(name:"AA",time_start:"16:00",time_end:"18:15")
    comp352.sections << Section.new(name:"AB",time_start:"10:00",time_end:"12:15")

      @mondaySections = [Course.find(3).sections.find(11),Course.find(1).sections.find(1)]
      @tuesdaySections = [Course.find(3).sections.find(11),Course.find(1).sections.find(1)]
      @wednesdaySections = [Course.find(3).sections.find(11),Course.find(1).sections.find(1)]
      @thursdaySections = [Course.find(3).sections.find(11),Course.find(1).sections.find(1)]
      @fridaySections = [Course.find(3).sections.find(11),Course.find(1).sections.find(1)]
  end

  def registered_courses
    #find courses the are linked to this student
   # @courses = Course.where(user_id: $authorized_user.user_id)
    #@student = $authorized_student
    #@allStudents = Student.all
    @courses = current_user.student.courses
    @totalCredits = 0

    @courses.each do |course|
      @totalCredits += course.credit
    end

  end
end
