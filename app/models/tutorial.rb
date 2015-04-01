class Tutorial < ActiveRecord::Base
  has_one :laboratory
  belongs_to :section
  has_one :course, through: :section
end
