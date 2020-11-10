class ExercisesController < ApplicationController
    def destroy
        @exercises = FoodItem.find_by_id(params[:id])
        @workout = @exercises.workout
        @exercises.destroy
        @workout.update_workout_calories
        @workout.save
        redirect_to edit_daily_journal_path(@workout.daily_journal)

      end

  private

  def set_meal
    @workout = Workout.find_by_id(params[:workout_id])
  end


  def food_item_params
    params.require(:exercises).permit(:name, :calories_burned)
  end

end
