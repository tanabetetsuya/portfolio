class RemoveColumnsFromExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercise_menus, :exercise_strength, :string
    remove_column :exercise_menus, :exercise_type, :string
    remove_column :exercise_menus, :exercise_amount, :integer
  end
end
