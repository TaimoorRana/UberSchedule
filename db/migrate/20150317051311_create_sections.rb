class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.references :course
      t.string :name
      t.string :time_start
      t.string :time_end
      t.string :instructor
      t.string :day_of_week
      t.string :term
    end
  end

  def down
    drop_table :sections
  end
end
