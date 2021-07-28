class AddExerciseTargetToExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_menus, :exercise_target, :string
  end
end
