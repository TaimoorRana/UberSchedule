class Laboratory < ActiveRecord::Base
  belongs_to :tutorial
  has_one :section, through: :tutorial
  has_one :course, through: :section
end
