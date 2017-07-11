class Pet < ApplicationRecord
  belongs_to :shelter, :foreign_key => :petfinder_shelterId, :primary_key => :petfinder_shelterId
  has_many :user_pets
  has_many :users, through: :user_pets

  def self.by_species(species)
    self.where("species LIKE '#{species}'")
  end

  def self.by_sex(sex)
    self.where("sex LIKE '#{sex}'")
  end

  def self.by_city(city)
    self.where("city LIKE '#{city}'")
  end

  def self.by_size(size)
    self.where("size LIKE '#{size}'")
  end

  def self.by_age(age)
    self.where("age LIKE '#{age}'")
  end
end
