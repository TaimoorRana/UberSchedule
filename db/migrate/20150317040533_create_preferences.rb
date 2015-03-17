class CreatePreferences < ActiveRecord::Migration
  def up
    create_table :preferences do |t|
      t.string 'preference'
    end
  end

  def down
    drop_table :preferences
  end
end
