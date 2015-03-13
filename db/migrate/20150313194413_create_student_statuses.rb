class CreateStudentStatuses < ActiveRecord::Migration
  def change
    create_table :student_statuses do |t|

      t.timestamps null: false
    end
  end
end
