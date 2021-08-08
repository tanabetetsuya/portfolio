class TodayExercisesController < ApplicationController
  def new
  end

  def create
      #youtube = Youtube.find(params[:youtube_id])
      #today_exercise = TodayExercise.new(today_exercise_params)
      #today_exercise.exercise_menu_id = exercise_menu.id
      #today_exercise.youtube_id = youtube.id
      #@today_exercise.title = snippet.title
      #@today_exercise.published_at = snippet.published_at
      #@today_exercise.channel_title = snippet.channel_title
      #@today_exercise.video_id = item.id.video.id
      #today_exercise.save
      #redirect_to new_exercise_path
  end

 

  private
  def today_exercise_params
    params.require(:today_exercise).permit(:youtube_id, :exercise_menu_id, :title, :channel_title, :published_at, :video_id)
  end
end
