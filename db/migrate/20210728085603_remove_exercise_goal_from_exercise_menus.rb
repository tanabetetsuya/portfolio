class RemoveExerciseGoalFromExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercise_menus, :Exercise_goal, :string
  end
end
