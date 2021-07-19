class RemoveVideoIdFromExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercise_suggestions, :video_id, :integer
  end
end
