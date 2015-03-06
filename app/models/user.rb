class User < ActiveRecord::Base
  #blowfish password encryption
  has_secure_password
end
