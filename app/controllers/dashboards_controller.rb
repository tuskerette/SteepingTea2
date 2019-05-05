class DashboardsController < ApplicationController
  def show
    @song = Song.new
    @songs = current_user.songs
  end
end
