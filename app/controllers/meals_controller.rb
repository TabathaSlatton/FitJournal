class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update, :destroy]

    def new
        @daily_journal = DailyJournal.find_by_id(params[:daily_journal_id])
        @meal = @daily_journal.meals.build
        @food_1 = @meal.food_items.build
        @food_2 = @meal.food_items.build
        @food_3 = @meal.food_items.build
        @food_4 = @meal.food_items.build

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
    def set_meal
        @meal = Meal.find_by_id(params[:id])
    end

    def daily_journal_params
        params.require(:meal).permit(:daily_journal_id, :time_eaten, :notes, :category, food_items:[:name, :calories, :carbs, :protein, :fat])
    end
end
