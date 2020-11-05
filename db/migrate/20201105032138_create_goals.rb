class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.boolean :private, default: false
      t.string :name
      t.boolean :completed, default: false
      t.datetime :goal_date
      t.integer :priority
      t.string :reward
      t.string :category

      t.timestamps
    end
  end
end
