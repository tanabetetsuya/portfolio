class AddColumnsToExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_suggestions, :title, :string
    add_column :exercise_suggestions, :published_at, :datetime
    add_column :exercise_suggestions, :channel_title, :string
    add_column :exercise_suggestions, :video_id, :integer
  end
end
