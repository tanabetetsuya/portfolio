class AddUserIdToExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_menus, :user_id, :integer
  end
end
