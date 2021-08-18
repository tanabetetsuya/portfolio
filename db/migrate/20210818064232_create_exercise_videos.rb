class CreateExerciseVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_videos do |t|

      t.timestamps
    end
  end
end
