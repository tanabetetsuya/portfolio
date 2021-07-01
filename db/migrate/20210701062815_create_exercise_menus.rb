class CreateExerciseMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_menus do |t|
      t.string :exercise_purpose
      t.string :exercise_strength
      t.string :exercise_type
      t.integer :exercise_amount

      t.timestamps
    end
  end
end
