class CreateMajorOptions < ActiveRecord::Migration
  def change
    create_table :major_options do |t|
      t.string "option"
      t.timestamps null: false
    end
  end
end
