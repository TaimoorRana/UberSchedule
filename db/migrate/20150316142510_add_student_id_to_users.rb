class AddStudentIdToUsers < ActiveRecord::Migration
  def up
    add_column :users , 'student_id', :integer, unique:true
  end
  def down
    remove_column :users, 'student_id'
  end
end
