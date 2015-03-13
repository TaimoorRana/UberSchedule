class Student < ActiveRecord::Base
  #self.table_name = 'tbl_student'
  has_many :courses
end
