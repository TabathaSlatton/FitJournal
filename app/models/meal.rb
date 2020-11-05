class Meal < ApplicationRecord
    belongs_to :daily_journal
    has_many :food_items

    accepts_nested_attributes_for :food_items, reject_if: proc { |attributes| attributes['name'].blank? ||  attributes['calories'].blank?}
end
