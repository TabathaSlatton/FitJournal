class Meal < ApplicationRecord
    belongs_to :daily_journal
    has_many :food_items
end
