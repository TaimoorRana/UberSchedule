class SequenceMakerController < ApplicationController
  layout 'general_schedule'


  def index
    #find the student
    student = Student.where(user_id: 18).first

    @courses_completed = student.courses
    sql = 'SELECT DISTINCT * FROM courses WHERE (dept,number) NOT IN ( SELECT dept,number FROM courses INNER JOIN courses_prereqs ON courses.course_id = courses_prereqs.course_id);'
    sql = 'SELECT * FROM courses_prereqs'
    @courses_with_no_prereqs_array = ActiveRecord::Base.connection.execute(sql)

    @all_courses = []
    @all_courses << Course.all
    @all_courses = @all_courses[0]

    @courses_prereq = []
    @courses_prereq << CoursesPrereq.all
    @courses_prereq = @courses_prereq[0]

    @no_prereq_courses = []


    @courses_with_no_prereqs_array.each do |cstring|
      @no_prereq_courses << castToCourse(cstring)
    end



  end

  def castToCourse(arrayOfStrings)
    return Course.new(course_id:arrayOfStrings[0],dept:arrayOfStrings[1],number:arrayOfStrings[2],credit:arrayOfStrings[3],name:arrayOfStrings[4],description:arrayOfStrings[5],sequence_id:arrayOfStrings[6])
  end



end
