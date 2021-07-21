class ExerciseMenusController < ApplicationController

  def index
    @comment = Comment.new
    @comments = Comment.all
    @user = current_user
    @exercise_menus = ExerciseMenu.includes(:liked_users).sort{|a,b| b.liked_users.size <=> a.liked_users.size } #いいね数ランキング表示
  end

  def new
    @exercise_menu = ExerciseMenu.new
  end

  def create
    @exercise_menu = ExerciseMenu.new(exercise_menu_params)
    @exercise_menu.user_id = current_user.id
    @exercise_menu.save
    @exercise_suggestions = current_user.exercise_suggestions.all
    @exercise_suggestions.each do |exercise_suggestion|
        @today_exercises = @exercise_menu.today_exercises.new
        @today_exercises.title = exercise_suggestion.title
        @today_exercises.channel_title = exercise_suggestion.channel_title
        @today_exercises.published_at = exercise_suggestion.published_at
        @today_exercises.video_id = exercise_suggestion.video_id
        @today_exercises.save
    end
    @exercise_suggestions = current_user.exercise_suggestions.destroy_all
    redirect_to exercise_menus_path
  end



  def show
    @exercise_menu = ExerciseMenu.find(params[:id])
    @comment = current_user.comments.new
  end

  def confirmation
    @exercise_suggestions = ExerciseSuggestion.all
    @exercise_menu = ExerciseMenu.new(exercise_menu_params)
  end

  private
  def exercise_menu_params
    params.require(:exercise_menu).permit(:user_id, :exercise_purpose, :exercise_strength, :exercise_type, :exercise_amount, :keyword)
  end
end
