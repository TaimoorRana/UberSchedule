class Tutorial < ActiveRecord::Base
  has_one :laboratory
  belongs_to :section
end
