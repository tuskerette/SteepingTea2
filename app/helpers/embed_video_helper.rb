module EmbedVideoHelper

  def embed(youtube_url, w, h)
    # TODO: better way to get the id, regex?
    youtube_id = youtube_url.split("=").last

    content_tag(:iframe, nil, src: "https://youtube.com/embed/#{youtube_id}", width:w, height:h)
  end

end
