module SongHelper
  def like_button(song)
    if current_user.liked?(song)
      link_to "Unlike", unlike_song_path(song), method: :delete
    else
      link_to "Like", like_song_path(song), method: :post
    end
  end

end
