class AddVideoIdToExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_suggestions, :video_id, :string
  end
end
