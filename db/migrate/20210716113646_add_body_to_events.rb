class AddBodyToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :body, :string
  end
end
