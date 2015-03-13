class Preference < ActiveRecord::Base
  belongs_to :tbl_student
  has_many :periods
end
