class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.references :tutorial
      t.string :name
      t.string :time_start
      t.string :time_end
      t.string :day
      t.timestamps null: false
    end
  end
end
