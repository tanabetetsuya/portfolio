class AddExerciseMenuIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :exercise_menu_id, :integer
  end
end
