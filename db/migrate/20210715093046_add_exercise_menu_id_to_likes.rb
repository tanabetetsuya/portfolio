class AddExerciseMenuIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :exercise_menu_id, :integer
  end
end
