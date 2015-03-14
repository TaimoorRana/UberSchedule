class DaysOfWeek < ActiveRecord::Base
  self.table_name = 'days_of_weeks'
  #enum status: { Monday: 1, Tuesday: 2, Wednesday: 3, Thursday: 4, Friday: 5, Saturday: 6, Sunday: 7 }
end

