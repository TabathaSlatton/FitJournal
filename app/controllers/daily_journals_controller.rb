class DailyJournalsController < ApplicationController
    before_action :set_journal, only: [:edit, :update, :destroy]

    def index
        @daily_journals = DailyJournal.all
    end

    def new
        @daily_journal = current_user.daily_journals.build
    end

    def create
        @daily_journal = current_user.daily_journals.build(daily_journal_params)
        if @daily_journal.save
            redirect_to daily_journals_path
        else
            render :new
        end
    end

    def edit
        if !@daily_journal
            redirect_to daily_journals_path
        end
    end

      def update
        if @daily_journal
          @daily_journal.update(daily_journal_params)
          if @daily_journal.errors.any?
            render "edit"
          else
            redirect_to daily_journals_path
          end
        else
          render "edit"
        end
      end
  
      def destroy
        @daily_journal.destroy
        redirect_to daily_journals_path
      end
  

    private
    def set_journal
        @daily_journal = DailyJournal.find_by_id(params[:id])
    end

    def daily_journal_params
        params.require(:daily_journal).permit(:user_id, :water_intake, :notes, :mood, :daily_goal)
    end

end
