class Student < ActiveRecord::Base
  has_one :preference
  has_and_belongs_to_many :courses
end
