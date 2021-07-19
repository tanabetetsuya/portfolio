class RemoveYoutubeIdFromExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercise_suggestions, :youtube_id, :integer
  end
end
