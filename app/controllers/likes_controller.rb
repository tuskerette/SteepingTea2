class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.like(song)
    redirect_to root_path
  end

  def destroy
    current_user.unlike(song)
    redirect_to root_path
  end

  private

  def song
    # we use id cause it's a member route. if it was a nested resource we should have used [:song_id]
    @_song ||= Song.find(params[:id])
  end
end
