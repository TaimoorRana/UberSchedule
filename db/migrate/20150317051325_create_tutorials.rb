class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.references :section
      t.string :name
      t.string :time_start
      t.string :time_end
      t.string :day
      t.timestamps null: false
    end
  end
end
