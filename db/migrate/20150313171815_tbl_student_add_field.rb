class TblStudentAddField < ActiveRecord::Migration
  def change
    add_column :tbl_student, :option, :string
  end
end
