class AddKeywordToYoutubes < ActiveRecord::Migration[5.2]
  def change
    add_column :youtubes, :keyword, :string
  end
end
