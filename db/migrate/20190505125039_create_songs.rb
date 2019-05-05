class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :song_url, null: false
      t.string :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
