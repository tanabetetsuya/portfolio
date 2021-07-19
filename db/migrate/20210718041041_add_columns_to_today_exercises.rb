class AddColumnsToTodayExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :today_exercises, :exercise_menu_id, :integer
    add_column :today_exercises, :youtube_id, :integer
  end
end
