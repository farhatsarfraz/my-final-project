class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :authentication_token
  has_one :bus

  ROLES = ['student', 'driver']

  def invalidate_auth_token
    self.authentication_token = nil
  end
end
