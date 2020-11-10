class ChangeWorkoutsColumnDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :workouts, :time_of_day, :datetime
  end
end
