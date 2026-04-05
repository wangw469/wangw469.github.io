module Jekyll
  class SongTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @artist = ""
      @title = ""
      parse_markup(markup)
    end

    def parse_markup(markup)
      # Support two formats:
      # {% song artist="Eason Chan" title="富士山下" %}
      # {% song "Eason Chan" "富士山下" %}
      
      if markup.include?("=")
        # Named parameters format
        markup.scan(/(\w+)\s*=\s*"([^"]*)"/) do |key, value|
          @artist = value if key == "artist"
          @title = value if key == "title"
        end
      else
        # Positional parameters format
        parts = markup.scan(/"([^"]*)"/)
        @artist = parts[0][0] if parts[0]
        @title = parts[1][0] if parts[1]
      end
    end

    def render(context)
      query = URI.encode_www_form_component("#{@artist} #{@title}")
      artist_encoded = URI.encode_www_form_component(@artist)
      title_encoded = URI.encode_www_form_component(@title)
      
      <<~HTML
        <div class="song-link">
          <span class="song-info">🎵 #{@artist} - #{@title}</span>
          <span class="song-services">
            <a href="https://bing.com/search?q=#{query}%20site%3Amusic.163.com" target="_blank" rel="noopener" title="NetEase Cloud Music">NetEase</a>
            <a href="https://bing.com/search?q=#{query}%20site%3Amusic.apple.com%2Fcn" target="_blank" rel="noopener" title="Apple Music">Apple Music</a>
            <a href="https://bing.com/search?q=#{query}%20site%3Abilibili.com" target="_blank" rel="noopener" title="Bilibili">bilibili</a>
            <a href="https://bing.com/search?q=#{query}%20site%3Adouban.com" target="_blank" rel="noopener" title="douban">豆瓣</a>
            <a href="https://open.spotify.com/search/#{query}" target="_blank" rel="noopener" title="Spotify">Spotify</a>
            <a href="https://music.youtube.com/search?q=#{query}" target="_blank" rel="noopener" title="YouTube Music">YouTube Music</a>
          </span>
        </div>
      HTML
    end
  end
end

Liquid::Template.register_tag("song", Jekyll::SongTag)
