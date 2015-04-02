class Tutorial < ActiveRecord::Base
  has_many :laboratories
  belongs_to :section
  has_one :course, through: :section
end
