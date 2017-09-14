class User < ApplicationRecord
  has_secure_password
  
  has_many :user_pets
  has_many :pets, through: :user_pets

end
