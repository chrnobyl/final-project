class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :color, :sex, :picture
end
