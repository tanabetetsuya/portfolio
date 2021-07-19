class AddColumns2ToTodayExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :today_exercises, :title, :string
    add_column :today_exercises, :published_at, :datetime
    add_column :today_exercises, :channel_title, :string
    add_column :today_exercises, :video_id, :integer
  end
end
