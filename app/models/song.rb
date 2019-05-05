class Song < ApplicationRecord
  belongs_to :user

  validates :song_url, presence: true, format: URI::regexp(%w(http https))
  validates :user, presence: true

  before_create :set_duration

  scope :white,  -> { where("duration > ? and duration < ?", 30, 90)}
  scope :green,  -> { where("duration > ? and duration < ?", 91, 180)}
  scope :black,  -> { where("duration > ? and duration < ?", 181, 300) }
  scope :herbal, -> { where("duration > ?", 301) }

  def set_duration
    video = Yt::Video.new url: self.song_url
    self.duration = video.duration
  end
end
