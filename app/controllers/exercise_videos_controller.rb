class ExerciseVideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercise_videos = ExerciseVideo.all
    @exercise_menu = ExerciseMenu.new
  end

  def create
    #binding.irb
    exercise_video = ExerciseVideo.new(exercise_suggestion_params)
    exercise_video.save
    redirect_to exercise_videos_path
  end

  def destroy
    exercise_video = ExerciseVideo.find(params[:id])
    exercise_video.destroy
    redirect_to exercise_videos_path
  end

  private
  def exercise_video_params
    params.require(:exercise_video).permit(:title, :channel_title, :published_at, :video_id, :user_id)
  end
end
