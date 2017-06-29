# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding shelters"
Shelter.create(name: "North Shore Animal League", password: "dogs", street: "25 Davis Ave", city: "Port Washington", state: "NY", zip: 11050)

# {name: "Brooklyn Animal Resource Coalition", password: "dogs", street: "253 Wythe Ave", city: "Brooklyn", state: "NY", zip: 11249}, {name: "Jackrabbit Animal Shelter", password: "dogs", street: "8110 Jackrabbit Rd", city: "Houston", state: "TX", zip: 77095})

puts "seeding users"
User.create(name: "Chris", password: "dogs")

# {name: "Charlie", password: "dogs"}, {name: "Gaby", password: "dogs"})

puts "seeding pets"
Pet.create(name: "Boot", species: "dog", age: 2, weight: 5, color: "brown", sex: "male", picture: "https://s-media-cache-ak0.pinimg.com/236x/46/2b/ef/462befe36955b89b8d6e21387d3617fb.jpg", shelter_id: 1)

Pet.create(name: "Shrimp", species: "cat", age: 5, weight: 5, color: "gray", sex: "female", picture: "http://www.catster.com/wp-content/uploads/2015/06/IMG_2311.jpg", shelter_id: 1)

Pet.create(name: "Mozart", species: "dog", age: 9, weight: 5, color: "brown", sex: "male", picture: "http://i1.kym-cdn.com/entries/icons/original/000/000/183/Cupcake_Dog.jpg", shelter_id: 1)

puts "seeding user pets"
UserPet.create(user_id: 1, pet_id: 1)
