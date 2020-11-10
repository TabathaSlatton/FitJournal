class Workout < ApplicationRecord
    belongs_to :daily_journal
    has_many :exercises, dependent: :destroy

    accepts_nested_attributes_for :exercises, reject_if: proc { |attributes| attributes['name'].blank? ||  attributes['calories_burned'].blank?}


    def update_workout_calories
        calories = 0
        self.exercises.each do |exercise|
            calories += exercise.calories_burned
        end
        self.calories_burned = calories
    end
end
