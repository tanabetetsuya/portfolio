class RemoveYoutubeIdFromTodayExercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :today_exercises, :youtube_id, :integer
  end
end
