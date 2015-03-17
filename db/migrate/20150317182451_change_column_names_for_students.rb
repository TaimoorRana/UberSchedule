class ChangeColumnNamesForStudents < ActiveRecord::Migration
  def change
    rename_column :students, 'firstname', 'first_name'
    rename_column :students, 'lastname', 'last_name'
  end
end
