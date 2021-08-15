class ChangeExerciseSuggestionsToExerciseVideos < ActiveRecord::Migration[5.2]
  def change
    rename_table :exercise_suggestions, :exercise_videos
  end
end
