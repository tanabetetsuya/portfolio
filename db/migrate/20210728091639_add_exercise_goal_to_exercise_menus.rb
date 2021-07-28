class AddExerciseGoalToExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_menus, :exercise_goal, :string
  end
end
