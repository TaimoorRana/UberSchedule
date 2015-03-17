class CreateCoursesRegistereds < ActiveRecord::Migration
  def change
    create_table :courses_registereds do |t|
      t.references :student
      t.references :courses
      t.references :term
      t.timestamps null: false
    end
  end
end
