require 'open-uri'

class UrlShortenerPlugin
  include Cinch::Plugin

  listen_to :channel

  def shorten(url)
    url = open("http://is.gd/create.php?format=simple&#{url}").read
    "Error" == url ? nil : url
  rescue OpenURI::HTTPError => e
    Rails.logger.info("Error shortening URL: #{url} because #{e}")
  end

  def listen(m)
    short_urls = URI.extract(m.message, ['http', 'https']).map {|url| shorten(url) }.compact

    short_urls.present? && m.reply(short_urls.join(', '))
  end

end
