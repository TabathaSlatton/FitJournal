class FoodItemsController < ApplicationController
    def new
        if params[:meal_id]
          set_meal
          @food_item = @meal.food_items.build
        else
          @food_item = FoodItem.new
        end
      end
    
      def create
        if params[:meal_id]
          set_meal
          @food_item = @meal.food_items.build(food_item_params)
        else
          @food_item = FoodItem.new(food_item_params)
        end
        if @food_item.save
            redirect_to daily_journals_path
        else
          render :new
        end
      end


  private

  def set_meal
    @meal = Meal.find_by_id(params[:sushi_id])
  end


  def food_item_params
    params.require(:food_item).permit(:name, :calories, :carbs, :protein, :fat)
  end


end
