class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.integer :meal_id
      t.string :name
      t.integer :calories
      t.integer :carbs
      t.integer :protein
      t.integer :fat

      t.timestamps
    end
  end
end
