class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string 'preference'
    end
  end
end
