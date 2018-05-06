class User < ApplicationRecord
   acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def invalidate_auth_token
    self.update_columns(aut: nil)
  end


end
