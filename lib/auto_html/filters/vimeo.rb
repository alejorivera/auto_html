AutoHtml.add_filter(:vimeo).with(:show_title => false, :show_byline => false, :show_portrait => false, :allow_fullscreen => false) do |text, options|
  text.gsub(/https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
    vimeo_id = $2
    show_title      = "title=0"    unless options[:show_title]
    show_byline     = "byline=0"   unless options[:show_byline]
    show_portrait   = "portrait=0" unless options[:show_portrait]
    allow_fullscreen = " webkitallowfullscreen mozallowfullscreen allowfullscreen" if options[:allow_fullscreen]
    query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
    query_string    = "?" + query_string_variables unless query_string_variables.empty?

    %{<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="//player.vimeo.com/video/#{vimeo_id}#{query_string} allowfullscreen"></iframe></div>}
  end
end
