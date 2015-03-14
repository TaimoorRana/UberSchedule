class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean 'loyola'
      t.boolean 'split'
      t.string 'option'
      t.string 'status'
      t.timestamps null: false
    end
  end
end
