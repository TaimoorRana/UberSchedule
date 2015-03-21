class Student < ActiveRecord::Base
  has_one :user
  has_many :courses_registereds
  has_and_belongs_to_many :preferences
  has_and_belongs_to_many :courses, join_table: 'completed_courses_students'
end
