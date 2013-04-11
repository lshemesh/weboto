require 'open-uri'

class UrlShortenerPlugin
  include Cinch::Plugin

  listen_to :channel

  def shorten(url)
    if url.length > 20
      url = open("http://is.gd/create.php?format=simple&#{url}").read
      "Error" == url ? nil : url
    else
      url
    end
  rescue OpenURI::HTTPError => e
    Rails.logger.info("Error shortening URL: #{url} because #{e}")
  end

  def listen(m)
    short_urls = URI.extract(m.message, ['http', 'https']).map {|url| shorten(url) }.compact

    short_urls.present? && m.reply(short_urls.join(', '))
  end

end
