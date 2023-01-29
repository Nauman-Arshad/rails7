class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role => [:user, :moderator, :admin]
  after_initialize :set_user_role, if: :new_record?

  def set_user_role
    self.role ||= :user
  end
end
