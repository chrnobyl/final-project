class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :password
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.string :petfinder_shelterId

      t.timestamps
    end
  end
end
