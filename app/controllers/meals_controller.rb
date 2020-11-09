class MealsController < ApplicationController
    before_action :set_daily_journal, only: [:edit, :update, :new, :create, :destroy]
    before_action :set_meal, only: [:edit, :update, :destroy]


    def new
        @daily_journal = DailyJournal.find_by_id(params[:daily_journal_id])
        @meal = @daily_journal.meals.build
        4.times { @meal.food_items.build}


    end

    def create
        @daily_journal = DailyJournal.find_by_id(params[:daily_journal_id])
        @meal = @daily_journal.meals.build(meal_params)
        @meal.update_meal_calories
        if @meal.save
          redirect_to edit_daily_journal_path(@daily_journal)
        else
            render :new
            @meal = @daily_journal.meals.build
            4.times { @meal.food_items.build}
        end
    end

    def edit
        if @meal.food_items.count < 6
            1.times { @meal.food_items.build}
        end
        if !@meal
          redirect_to edit_daily_journal_path(@daily_journal), notice: "meal not found"
        end
    end

      def update
        # binding.pry
        if @meal
          @meal.update(meal_params)
          @meal.update_meal_calories
          if @meal.errors.any?
            render "edit"
          else
            @meal.save
            redirect_to edit_daily_journal_path(@daily_journal)
          end
        else
          render "edit"
        end
      end
  
      def destroy
        @meal.destroy
        redirect_to edit_daily_journal_path(@daily_journal)
      end
  
    
    private
    def set_meal
        @meal = Meal.find_by_id(params[:id])
    end

    def set_daily_journal
        @daily_journal = DailyJournal.find_by_id(params[:daily_journal_id])
    end

    def meal_params
        params.require(:meal).permit(:daily_journal_id, :time_eaten, :notes, :category, food_items_attributes:[:name, :calories, :carbs, :protein, :fat, :id])
    end
end
