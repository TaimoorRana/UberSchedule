class RenameCoursesStudentsToCoursesStudentsCompleted < ActiveRecord::Migration
  def change
    rename_table :courses_students, :completed_courses_students
  end
end
