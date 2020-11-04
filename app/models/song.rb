class Song < ApplicationRecord
  belongs_to :user

  validates :song_url, presence: true, format: URI::regexp(%w(http https))
  validates :user, presence: true

  before_create :set_duration_title

  scope :white,  -> { where("duration > ? and duration < ?", 30, 90)}
  scope :green,  -> { where("duration > ? and duration < ?", 91, 180)}
  scope :black,  -> { where("duration > ? and duration < ?", 181, 300) }
  scope :herbal, -> { where("duration > ?", 301) }


  delegate :username, to: :user

  private

  def set_duration_title
    truncated_video_id = self.song_url.split('=').last
    video = Yt::Video.new id: truncated_video_id
    self.duration = video.duration
    # self.title = video.title
  end
end
