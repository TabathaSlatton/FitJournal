class DailyJournal < ApplicationRecord
    # validates :name, presence: true, uniqueness: true
    has_many :workouts, dependent: :destroy
    has_many :meals, dependent: :destroy
    # accepts_nested_attributes_for :workouts, reject_if: proc { |attributes| attributes['name'].blank? ||  attributes['calories_burned'].blank?}
    # accepts_nested_attributes_for :meals, reject_if: proc { |attributes| attributes['name'].blank? ||  attributes['calories'].blank?}
    has_many :food_items, through: :meals
    has_many :exercises, through: :workouts

end
