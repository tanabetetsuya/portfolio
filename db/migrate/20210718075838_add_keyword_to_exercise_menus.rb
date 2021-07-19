class AddKeywordToExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_menus, :keyword, :string
  end
end
