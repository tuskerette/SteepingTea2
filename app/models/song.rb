class Song < ApplicationRecord
  belongs_to :user

  validates :song_url, presence: true, format: URI::regexp(%w(http https))
  validates :user, presence: true
end
