class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :size, :sex, :description, :picture
end
