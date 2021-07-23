class AddVideoIdToTodayExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :today_exercises, :video_id, :string
  end
end
