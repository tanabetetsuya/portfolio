class ExerciseSuggestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercise_suggestions = ExerciseSuggestion.all
    @exercise_menu = ExerciseMenu.new
  end

  def create
    #binding.irb
    exercise_suggestion = ExerciseSuggestion.new(exercise_suggestion_params)
    exercise_suggestion.save
    redirect_to exercise_suggestions_path
  end

  def destroy
    exercise_suggestion = ExerciseSuggestion.find(params[:id])
    exercise_suggestion.destroy
    redirect_to exercise_suggestions_path
  end

  private
  def exercise_suggestion_params
    params.require(:exercise_suggestion).permit(:title, :channel_title, :published_at, :video_id, :user_id)
  end
end
