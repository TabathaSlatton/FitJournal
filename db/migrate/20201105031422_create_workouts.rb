class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.integer :daily_journal_id
      t.datetime :time_of_day
      # ex: morning, afternoon, night
      t.integer :calories_burned
      t.string :focus
      t.string :duration
      #ex: 30 minutes, 1 hour
      t.text :notes

      t.timestamps
    end
  end
end
