class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :age, :size, :sex, :description, :picture, :email, :city, :state, :zip, :petfinder_shelterId, :shelter

  def shelter
    Shelter.find_by(petfinder_shelterId: object.petfinder_shelterId).name
  end
end
