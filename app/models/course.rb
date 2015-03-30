class Course < ActiveRecord::Base
  has_and_belongs_to_many :students, join_table: 'completed_courses_students'
  has_and_belongs_to_many :sequences
  has_many :courses_registereds
  has_many :courses_prereqs
  has_many :sections
  has_many :tutorials, through: :sections
  has_many  :laboratories,through: :tutorials
end
