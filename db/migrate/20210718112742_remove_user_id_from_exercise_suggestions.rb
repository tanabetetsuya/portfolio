class RemoveUserIdFromExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercise_suggestions, :user_id, :string
  end
end
