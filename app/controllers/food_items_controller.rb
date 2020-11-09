class FoodItemsController < ApplicationController
  
      def destroy
        @food_item = FoodItem.find_by_id(params[:id])
        @meal = @food_item.meal
        @food_item.destroy
        @meal.update_meal_calories
        @meal.save
        redirect_to edit_daily_journal_path(@meal.daily_journal)

      end

  private

  def set_meal
    @meal = Meal.find_by_id(params[:sushi_id])
  end


  def food_item_params
    params.require(:food_item).permit(:name, :calories, :carbs, :protein, :fat)
  end


end
