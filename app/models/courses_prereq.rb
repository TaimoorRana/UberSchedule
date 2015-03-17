class CoursesPrereq < ActiveRecord::Base
  belongs_to :prereq_type
  belongs_to :course
end
