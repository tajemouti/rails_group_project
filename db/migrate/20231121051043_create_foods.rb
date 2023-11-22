class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :food
      t.string :measurement_unit
      t.integer :price

      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end