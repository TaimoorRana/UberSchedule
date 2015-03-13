class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string 'day'
      t.string 'timeSlot'
      t.timestamps null: false
    end
  end
end
