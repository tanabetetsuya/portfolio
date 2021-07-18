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
    exercise_menu = ExerciseMenu.new(exercise_menu_params)
    exercise_menu.user_id = current_user.id
    exercise_menu.save
    redirect_to exercise_menus_path
  end

  def show
    @exercise_menu = ExerciseMenu.find(params[:id])
    @comment = current_user.comments.new
  end

  private
  def exercise_menu_params
    params.require(:exercise_menu).permit(:user_id, :exercise_purpose, :exercise_strength, :exercise_type, :exercise_amount)
  end
end
