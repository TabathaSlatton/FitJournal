class DailyJournalsController < ApplicationController

    def index
        @daily_journals = DailyJournal.all
    end

    def new
        @daily_journal = DailyJournal.new
    end

    def create
        @daily_journal = DailyJournal.new(daily_journal_params)
        if @daily_journal.save
            redirect_to @daily_journal
        else
            render :new
        end
    end

    private
    def daily_journal_params
        params.require(:daily_journal).permit(:user_id, :water_intake, :notes, :mood, :daily_goal)
    end

end
