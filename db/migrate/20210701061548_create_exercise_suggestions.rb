class CreateExerciseSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_suggestions do |t|

      t.timestamps
    end
  end
end
