class Section < ActiveRecord::Base
  has_many :tutorials
  belongs_to :course
end
