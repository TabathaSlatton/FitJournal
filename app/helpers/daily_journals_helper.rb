module DailyJournalsHelper

    def last_journal_date
        DailyJournal.all.last.created_at.strftime('%A, %b %d')
    end

    def need_new_journal?
        if last_journal_date == current_date
            false
        else 
            true
        end
    end

    def todays_journal
        DailyJournal.find_by(created_at: Date.new)
    end

end
