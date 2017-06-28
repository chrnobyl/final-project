# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding shelters"
Shelter.create(name: "Jackrabbit Animal Shelter", password: "dogs", location: "New York")

puts "seeding users"
User.create(name: "Chris", password: "dog")

puts "seeding pets"
Pet.create(name: "Boot", species: "dog", age: 2, weight: 5, color: "brown", sex: "male", shelter_id: 1)
# shrimp = Pet.create(name: "Shrimp", species: "cat", age: 5, weight: 5, color: "gray", sex: "female", shelter_id: 1, user_id: nil)
# mozart = Pet.create(name: "Mozart", species: "dog", age: 9, weight: 5, color: "brown", sex: "male", shelter_id: 1, user_id: nil)

puts "seeding user pets"
UserPet.create(user_id: 1, pet_id: 1)
