class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :daily_journal_id
      t.datetime :time_eaten
      t.integer :calories
      t.integer :carbs
      t.integer :protein
      t.string :category
      t.text :notes
      t.integer :fat

      t.timestamps
    end
  end
end
