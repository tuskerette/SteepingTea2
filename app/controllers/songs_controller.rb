class SongsController < ApplicationController
  def create
    song = current_user.songs.create(song_params)
    redirect_to root_path, redirect_options_for(song)
  end

  private

  def song_params
    params.require(:song).permit(:song_url, :notes)
  end

  def redirect_options_for(song)
    if song.persisted?
      { notice: "Song added successfully" }
    else
      { alert: "Good Old Something Went Wrong" }
    end
  end
end
