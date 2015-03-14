class AddDefaultsToPreference < ActiveRecord::Migration
  def change
    change_column :preferences, :loyola, :boolean, :default => 0
    change_column :preferences, :split, :boolean, :default => 0
    change_column :preferences, :option, :string, :default => "None"
    change_column :preferences, :status, :string, :default => "Full-Time"
    change_column :preferences, :monday_am, :boolean, :default => 0
    change_column :preferences, :monday_pm, :boolean, :default => 0
    change_column :preferences, :tuesday_am, :boolean, :default => 0
    change_column :preferences, :tuesday_pm, :boolean, :default => 0
    change_column :preferences, :wednesday_am, :boolean, :default => 0
    change_column :preferences, :wednesday_pm, :boolean, :default => 0
    change_column :preferences, :thursday_am, :boolean, :default => 0
    change_column :preferences, :thursday_pm, :boolean, :default => 0
    change_column :preferences, :friday_am, :boolean, :default => 0
    change_column :preferences, :friday_pm, :boolean, :default => 0
  end
end
