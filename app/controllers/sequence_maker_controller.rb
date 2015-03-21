class SequenceMakerController < ApplicationController
  layout 'general_schedule'


  def index
    #find the student
    student = Student.where(user_id: 18).first

    @courses_completed = student.courses
    sql = 'SELECT DISTINCT * FROM courses WHERE (dept,number) NOT IN ( SELECT dept,number FROM courses INNER JOIN courses_prereqs ON courses.course_id = courses_prereqs.course_id);'
    @courses_with_no_prereqs_array = ActiveRecord::Base.connection.execute(sql)

    @courses = cast_to_course(ActiveRecord::Base.connection.execute('SELECT * FROM courses'))
    @courses_prereqs = cast_to_courses_prereq(ActiveRecord::Base.connection.execute('SELECT * FROM courses_prereqs'))
    @courses_completed = ActiveRecord::Base.connection.execute('SELECT * FROM completed_courses_students')
    @courses_registered = cast_to_courses_registered (ActiveRecord::Base.connection.execute('SELECT * FROM completed_courses_students'))
    @Success = []
    @five_courses = []


   @courses.each do |course|
     course_found_courses_complete = false
     course_found_courses_registered = false

     @courses_completed.each do |course_completed|
       if student.id == course_completed[1] && course.id == course_completed[0]
         course_found_courses_complete = true
       end
     end

     @courses_registered.each do |course_registered|
       if student.id == course_registered.student_id && course.id == course_registered.courses_id
         course_found_courses_registered = true
       end
     end

     if course_found_courses_complete == false && course_found_courses_registered == false
       @five_courses << course
       CoursesRegistered.create(student_id:student.id, courses_id:course.id)
     end
     if @five_courses.size >= 5
       break
     end

   end



    # @courses.each do |course|
    #   found = false
    #   @courses_prereqs.each do |course_prereq|
    #     if course_prereq.course_id == course.course_id
    #       found = true
    #       break
    #     end
    #   end
    #   if found == false
    #   @Success << course
    #   end
    # end






  end

  def cast_to_course(arrayOfStrings)
    arr = []
    arrayOfStrings.each do |cstring|
      arr << Course.new(course_id:cstring[0],dept:cstring[1],number:cstring[2],credit:cstring[3],name:cstring[4],description:cstring[5],sequence_id:cstring[6])
    end

    return arr
  end

  def cast_to_courses_prereq(arrayOfStrings)
    arr = []
    arrayOfStrings.each do |cstring|
      arr << CoursesPrereq.new(id:cstring[0],course_id:cstring[1],prereq_type_id:cstring[2])
    end

    return arr
  end

  def cast_to_courses_registered(arrayOfStrings)
    arr = []
    arrayOfStrings.each do |cstring|
      arr << CoursesRegistered.new(id:cstring[0],student_id:cstring[1],courses_id:cstring[2],term_id:cstring[3])
    end

    return arr
  end






end
