class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :exercise_name
      t.text :how_to_exercise
      t.integer :exercise_time
      t.string :exercise_type

      t.timestamps
    end
  end
end
