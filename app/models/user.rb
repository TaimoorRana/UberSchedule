class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :student
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_student

  private

  def create_student
    Student.create(user_id: self.id, first_name: self.first_name, last_name: self.last_name)
  end
end
