class AddColumnDaysOfWeek < ActiveRecord::Migration
  def change
    add_column 'days_of_weeks', "Day", :string
  end
end
