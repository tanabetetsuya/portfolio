class AddUserIdToExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_suggestions, :user_id, :integer
  end
end
