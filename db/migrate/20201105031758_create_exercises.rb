class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.string :name
      t.integer :calories_burned

      t.timestamps
    end
  end
end
