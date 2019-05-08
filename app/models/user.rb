class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :songs, dependent: :destroy
  has_many :likes
  has_many :liked_songs, through: :likes, source: :song

  def like(song)
    liked_songs << song
  end

  def unlike(song)
    liked_songs.destroy(song)
  end

  def liked?(song)
    liked_song_ids.include?(song.id)
  end
end
