class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, 
  :rememberable, :validatable, :trackable , :timeoutable

  belongs_to :employee

  def user_object
    {
      email: email
    }
  end
end
