class Course < ActiveRecord::Base
 has_and_belongs_to_many :students
  belongs_to :sequence
end
