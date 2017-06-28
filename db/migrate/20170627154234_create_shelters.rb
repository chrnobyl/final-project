class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :password
      t.string :location

      t.timestamps
    end
  end
end
