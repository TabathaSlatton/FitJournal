class Workout < ApplicationRecord
    belongs_to :daily_journal
    has_many :exercises, dependent: :destroy

    def update_workout_calories
        calories = 0
        self.exercises.each do |exercise|
            calories += exercise.calories_burned
        end
        self.calories_burned = calories
    end
end
