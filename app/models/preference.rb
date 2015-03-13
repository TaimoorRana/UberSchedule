class Preference < ActiveRecord::Base
  belongs_to :students
  has_many :periods
end
