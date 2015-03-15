class AddIndextoCourses < ActiveRecord::Migration
  def change
    add_index :courses, :sequence_id
  end
end
