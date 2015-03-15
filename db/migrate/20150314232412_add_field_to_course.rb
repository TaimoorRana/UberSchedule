class AddFieldToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :sequence_id, :integer
  end
end
