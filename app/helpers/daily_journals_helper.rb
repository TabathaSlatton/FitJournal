module DailyJournalsHelper

    def last_journal_date
        current_user.daily_journals.last.created_at.strftime('%A, %b %d')
    end

    def need_new_journal?
        if last_journal_date == current_date
            false
        else 
            true
        end
    end

    def todays_journal
        current_user.daily_journals.last
        # dependent on need_new_journal and last_jounal_date
    end

    def update_daily_calories
        if !need_new_journal?
            calories = 0
            todays_journal.meals.each do |meal|
                calories += meal.calories
            end
            calories
        else
            "Please update your journal to access calorie information"
        end
    end
end
