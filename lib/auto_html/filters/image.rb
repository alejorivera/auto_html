AutoHtml.add_filter(:image) do |text|
  text.gsub(/(?<!src=")https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    %{<img src="#{match}" class="img-responsive center-block web-img" />}
  end
end
