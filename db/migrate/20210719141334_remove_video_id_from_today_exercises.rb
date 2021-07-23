class RemoveVideoIdFromTodayExercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :today_exercises, :video_id, :integer
  end
end
