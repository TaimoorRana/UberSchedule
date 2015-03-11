class User < ActiveRecord::Base
  #blowfish password encryption
  self.table_name = 'tbl_user'
  has_many :tbl_course
  #has_secure_password
end
