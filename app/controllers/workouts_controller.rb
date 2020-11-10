class WorkoutsController < ApplicationController
    before_action :set_daily_journal, only: [:edit, :update, :new, :create, :destroy]
    before_action :set_workout, only: [:edit, :update, :destroy]


    def new
        @workout = @daily_journal.workouts.build
        4.times { @workout.exercises.build}
    end

    def create
        @workout = @daily_journal.workouts.build(workout_params)
        @workout.update_workout_calories
        if @workout.save
          redirect_to edit_daily_journal_path(@daily_journal)
        else
            render :new
            @workout = @daily_journal.workout.build
            4.times { @workout.exercises.build}
        end
    end

    def edit
        if @workout.exercises.count < 6
            1.times { @workout.exercises.build}
        end
        if !@workout
          redirect_to edit_daily_journal_path(@daily_journal), notice: "Workout not found"
        end
    end

      def update
        # binding.pry
        if @workout
          @workout.update(workout_params)
          @workout.update_workout_calories
          if @workout.errors.any?
            render "edit"
          else
            @workout.save
            redirect_to edit_daily_journal_path(@daily_journal)
          end
        else
          render "edit"
        end
      end
  
      def destroy
        @workout.destroy
        redirect_to edit_daily_journal_path(@daily_journal) 
      end
  
    
    private
    def set_workout
        @workout = Workout.find_by_id(params[:id])
    end

    def set_daily_journal
        @daily_journal = DailyJournal.find_by_id(params[:daily_journal_id])
    end

    def workout_params
        params.require(:workout).permit(:daily_journal_id, :time_of_day, :notes, :focus, :duration, exercises_attributes:[:name, :calories_burned, :id])
    end
end
