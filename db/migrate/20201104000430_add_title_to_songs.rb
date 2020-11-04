class AddTitleToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :title, :string, null: false, default: 'missing title'
  end
end
