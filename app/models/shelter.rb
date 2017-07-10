class Shelter < ApplicationRecord
  has_many :pets, :foreign_key => :petfinder_shelterId, :primary_key => :petfinder_shelterId
end
