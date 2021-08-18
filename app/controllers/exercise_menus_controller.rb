class ExerciseMenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = Comment.new
    @comments = Comment.all
    @user = current_user
    @exercise_menus = ExerciseMenu.includes(:liked_users).sort{|a,b| b.liked_users.size <=> a.liked_users.size } #いいね数ランキング表示
  end

  def new
    @exercise_menu = ExerciseMenu.new
  end

  def confirmation
    @exercise_videos = ExerciseVideo.all
    @exercise_menu = ExerciseMenu.new(exercise_menu_params)
  end

  def create
    @exercise_menu = ExerciseMenu.new(exercise_menu_params)
    @exercise_menu.user_id = current_user.id
    if @exercise_menu.save
    @exercise_videos = current_user.exercise_videos.all
    @exercise_videos.each do |exercise_video|
      @today_exercises = @exercise_menu.today_exercises.new
      @today_exercises.title = exercise_video.title
      @today_exercises.channel_title = exercise_video.channel_title
      @today_exercises.published_at = exercise_video.published_at
      @today_exercises.video_id = exercise_video.video_id
      @today_exercises.save
      end
      @exercise_videos = current_user.exercise_videos.destroy_all
      redirect_to exercise_menus_path
    else
      render :new
    end
  end

  def show
    @exercise_menu = ExerciseMenu.find(params[:id])
  end

  private
  def exercise_menu_params
    params.require(:exercise_menu).permit(:user_id, :exercise_purpose, :exercise_goal)
  end
end
