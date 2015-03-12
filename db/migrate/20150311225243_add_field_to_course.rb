class AddFieldToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_option, :string
  end
end
