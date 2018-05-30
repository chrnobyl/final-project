class CreateUserPets < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pets do |t|
      t.integer :user_id
      t.integer :petfinder_id
      t.string :pet_name
      t.string :animal
      t.string :sex
      t.string :age
      t.string :size
      t.string :breeds
      t.boolean :mix
      t.string :options
      t.string :description
      t.string :status
      t.string :last_petfinder_update
      t.string :photo
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.string :shelter_id
      t.string :shelter_pet_id

      t.timestamps
    end
  end
end
