class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true

  has_many :user_pets
  # has_many :pets, through: :user_pets

  # def self.authenticate(identifier, password)
  #   username = User.find_by(name: identifier)
  #   username.authenticate(password) if !!username
  # end

end
