class CreateCoursesPrereqs < ActiveRecord::Migration
  def change
    create_table :courses_prereqs do |t|
      t.references :course
      t.references :prereq_type
      t.integer :course_id_prereq
      t.timestamps null: false
    end
  end
end
