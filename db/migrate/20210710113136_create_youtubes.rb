class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|

      t.timestamps
    end
  end
end
