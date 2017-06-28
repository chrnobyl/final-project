class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.integer :weight
      t.string :color
      t.string :sex
      t.belongs_to :shelter, foreign_key: true

      t.timestamps
    end
  end
end
