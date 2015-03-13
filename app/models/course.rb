class Course < ActiveRecord::Base
  #self.table_name = 'tbl_course'
  has_and_belongs_to_many :users
end
