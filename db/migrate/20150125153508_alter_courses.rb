class AlterCourses < ActiveRecord::Migration
  def up
    add_column("courses","course_code",:string, :limit => 15 ,:default => "course code")
    add_column("courses","name",:string ,:default => "course name")
    add_column("courses","credits",:float, :limit => 2 ,:default => "3")
    add_column("courses","description",:string,:default => "course description")
  end
  
  def down
    remove_column("courses","course_code")
    remove_column("courses","name")
    remove_column("courses","credits")
    remove_column("courses","description")
  end
end
