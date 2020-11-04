class CreateDailyJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_journals do |t|
      t.integer :user_id
      t.integer :water_intake
      t.text :notes
      t.string :mood
      t.string :daily_goal

      t.timestamps
    end
  end
end
