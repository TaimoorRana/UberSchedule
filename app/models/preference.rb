class Preference < ActiveRecord::Base
  belongs_to :student
  has_many :periods
end
