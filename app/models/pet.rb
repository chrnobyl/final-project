class Pet < ApplicationRecord
  belongs_to :shelter, :foreign_key => :petfinder_shelterId, :primary_key => :petfinder_shelterId
  has_many :user_pets
  has_many :users, through: :user_pets
end
