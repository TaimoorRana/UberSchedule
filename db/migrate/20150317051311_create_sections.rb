class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :course
      t.string :name
      t.string :number
      t.string :time_start
      t.string :time_end
      t.string :instructor
      t.string :day_of_week
      t.string :term
      t.timestamps null: false
    end
  end
end
