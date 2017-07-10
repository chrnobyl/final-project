class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :age
      t.string :size
      t.string :sex
      t.string :description
      t.string :picture
      t.belongs_to :shelter, foreign_key: true

      t.timestamps
    end
  end
end
