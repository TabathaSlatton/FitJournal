class DailyJournalsController < ApplicationController
    before_action :set_journal, only: [:show, :edit, :update, :destroy]

    def index
        @daily_journals = DailyJournal.all
    end

    def new
        # if DailyJournal.all.last.created_at  ..... conditional to make a new form when date has changed
        @daily_journal = DailyJournal.new
        @new_meal = @daily_journal.meals.build
        @food_1 = @new_meal.food_items.build
        @food_2 = @new_meal.food_items.build
        @food_3 = @new_meal.food_items.build

        #build out nested object
            # @daily_journal.workouts.build()
    end

    def create
        @daily_journal = DailyJournal.new(daily_journal_params)
        if @daily_journal.save
            redirect_to @daily_journal
        else
            render :new
        end
    end
  
      def show
        if !@daily_journal
          redirect_to daily_journals_path
        end
      end

    private
    def set_journal
        @daily_journal = DailyJournal.find_by_id(params[:id])
    end

    def daily_journal_params
        params.require(:daily_journal).permit(:user_id, :water_intake, :notes, :mood, :daily_goal)
    end

end
