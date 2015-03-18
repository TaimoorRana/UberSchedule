class CreatePreferencesStudents < ActiveRecord::Migration
  def change
    create_table :preferences_students, id: false do |t|
      t.references :student
      t.references :preference
    end
  end
end
