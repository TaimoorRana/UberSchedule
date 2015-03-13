class CreateDaysOfWeeks < ActiveRecord::Migration
  def change
    create_table :days_of_weeks do |t|

      t.timestamps null: false
    end
  end
end
