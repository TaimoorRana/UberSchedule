class RemoveOptionFromPreferences < ActiveRecord::Migration
  def change
    remove_column :preferences, :option
  end
end
