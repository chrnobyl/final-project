require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

all_dogs = RestClient.get("http://api.petfinder.com/pet.find?key=#{ENV['PETFINDER_API_KEY']}&animal=dog&location=NY&count=26&output=basic&format=json")
dogs_hash = JSON.parse(all_dogs)
dogs_hash = dogs_hash["petfinder"]["pets"]["pet"]

all_cats = RestClient.get("http://api.petfinder.com/pet.find?key=#{ENV['PETFINDER_API_KEY']}&animal=cat&location=NY&count=25&output=basic&format=json")
cats_hash = JSON.parse(all_cats)
cats_hash = cats_hash["petfinder"]["pets"]["pet"]

all_shelters = RestClient.get("http://api.petfinder.com/shelter.find?key=#{ENV['PETFINDER_API_KEY']}&location=NY&count=25&output=basic&format=json")
shelters_hash = JSON.parse(all_shelters)
shelters_hash = shelters_hash["petfinder"]["shelters"]["shelter"]

puts "seeding shelters"
shelters_hash.each do |shelter|
  Shelter.create(name: shelter["name"]["$t"], password: "dogs", city: shelter["city"]["$t"], state: shelter["state"]["$t"], zip: shelter["zip"]["$t"], email: shelter["email"]["$t"], phone: shelter["phone"]["$t"])
end
# Shelter.create(name: "North Shore Animal League", password: "dogs", street: "25 Davis Ave", city: "Port Washington", state: "NY", zip: 11050)

# {name: "Brooklyn Animal Resource Coalition", password: "dogs", street: "253 Wythe Ave", city: "Brooklyn", state: "NY", zip: 11249}, {name: "Jackrabbit Animal Shelter", password: "dogs", street: "8110 Jackrabbit Rd", city: "Houston", state: "TX", zip: 77095})

puts "seeding users"
User.create(name: "Chris", password: "dogs")

# {name: "Charlie", password: "dogs"}, {name: "Gaby", password: "dogs"})

puts "seeding dogs"
dogs_hash.each do |dog|
  if dog["media"] != {}
    Pet.create(name: dog["name"]["$t"], species: "dog", age: dog["age"]["$t"], size: dog["size"]["$t"], sex: dog["sex"]["$t"], description: dog["description"]["$t"], picture: dog["media"]["photos"]["photo"][3]["$t"], email: dog["contact"]["email"]["$t"], city: dog["contact"]["city"]["$t"], state: dog["contact"]["state"]["$t"], zip: dog["contact"]["zip"]["$t"], shelter_id: 1)
  end
end

puts "seeding cats"
cats_hash.each do |cat|
  if cat["media"] != {} && cat["name"]["$t"] != "FOSTER HOMES NEEDED" && cat["description"] != {}
    Pet.create(name: cat["name"]["$t"], species: "cat", age: cat["age"]["$t"], size: cat["size"]["$t"], sex: cat["sex"]["$t"], description: cat["description"]["$t"], picture: cat["media"]["photos"]["photo"][3]["$t"], email: cat["contact"]["email"]["$t"], city: cat["contact"]["city"]["$t"], state: cat["contact"]["state"]["$t"], zip: cat["contact"]["zip"]["$t"], shelter_id: 1)
  end
end

# Pet.create(name: "Lily", species: "dog", age: 2, weight: 5, color: "brown", sex: "female", description: "Lily is a fat dachshund whose coat resembles the wood grain of a fine piece of furniture. She needs to be held for at least three hours a day.", picture: "http://dachshundrescueofohio.org/assets/images/donate-doggy.jpg", shelter_id: 1)
#
# Pet.create(name: "Brodie", species: "cat", age: 5, weight: 5, color: "gray", sex: "male", description: "Brodie is a pretty chill dude. He enjoys lounging in bed during the day, and biting you in the wee hours of the morning until you wake up to feed him.", picture: "http://www.freewebs.com/starclanswarriorsrpsite/mvc_stumpytail.jpg", shelter_id: 1)
#
# Pet.create(name: "Stains", species: "dog", age: 9, weight: 5, color: "brown", sex: "male", description: "Loves cupcakes but is too well behaved to eat them.", picture: "http://i1.kym-cdn.com/entries/icons/original/000/000/183/Cupcake_Dog.jpg", shelter_id: 1)
#
# Pet.create(name: "Balto", species: "dog", age: 14, weight: 5, color: "brown", sex: "male", description: "Sled dog who saved a bunch of Alaskans from dyptheria. Good with children.", picture: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Balto.jpg/800px-Balto.jpg", shelter_id: 1)
#
# Pet.create(name: "Hachiko", species: "dog", age: 11, weight: 5, color: "white", sex: "male", description: "Very loyal.", picture: "https://upload.wikimedia.org/wikipedia/commons/6/6b/Hachiko.JPG", shelter_id: 1)
#
# Pet.create(name: "Hooch", species: "dog", age: 4, weight: 5, color: "brown", sex: "male", description: "Good at solving mysteries.", picture: "http://cdn3-www.dogtime.com/assets/uploads/gallery/dogue-de-bordeaux-dog-breed-pictures/resting-8.jpg", shelter_id: 1)
#
# Pet.create(name: "Target Dog", species: "dog", age: 4, weight: 5, color: "white", sex: "female", description: "Had a successful career as the mascot for Target before drugs ruined his life. Looking for a furever home.", picture: "https://pbs.twimg.com/media/Ce4wswUVIAAnaE_.jpg", shelter_id: 1)
#
# Pet.create(name: "Morris", species: "cat", age: 73, weight: 5, color: "orange", sex: "male", description: "Morris is very old.", picture: "http://www.kittens-lair.net/store/en/articles/img250.jpg", shelter_id: 1)
#
# Pet.create(name: "Venus", species: "cat", age: 4, weight: 5, color: "white", sex: "female", description: "Half black cat, half yellow cat.", picture: "http://static.boredpanda.com/blog/wp-content/uploads/2014/11/most-popular-cats-venus-1__605.jpg", shelter_id: 1)

# puts "seeding user pets"
# UserPet.create(user_id: 1, pet_id: 1)
