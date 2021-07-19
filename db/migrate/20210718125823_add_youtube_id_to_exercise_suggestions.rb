class AddYoutubeIdToExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_suggestions, :youtube_id, :integer
  end
end
