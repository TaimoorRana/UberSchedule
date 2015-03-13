class User < ActiveRecord::Base
  #blowfish password encryption
  has_many :courses
  #has_secure_password
end
