class Workout < ApplicationRecord
    belongs_to :daily_journal
    has_many :exercises 
end