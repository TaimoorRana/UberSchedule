class AddFieldsToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :student_id, :integer
    add_column :preferences, :monday_am, :integer
    add_column :preferences, :monday_pm, :integer
    add_column :preferences, :tuesday_am, :integer
    add_column :preferences, :tuesday_pm, :integer
    add_column :preferences, :wednesday_am, :integer
    add_column :preferences, :wednesday_pm, :integer
    add_column :preferences, :thursday_am, :integer
    add_column :preferences, :thursday_pm, :integer
    add_column :preferences, :friday_am, :integer
    add_column :preferences, :friday_pm, :integer

  end
end
