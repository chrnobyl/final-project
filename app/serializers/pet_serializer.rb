class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :picture
end
