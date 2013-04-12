require 'open-uri'

class UrlShortenerPlugin
  include Cinch::Plugin

  listen_to :channel

  def shorten(url)
    Rails.logger.info("Shortening URL #{url}")

    if url.length > 20
      query_url = "http://is.gd/create.php?format=simple&#{url}"
      Rails.logger.info("Query URL: #{query_url}")
      url = open(query_url).read
      "Error" == url ? nil : url
    else
      url
    end
  rescue OpenURI::HTTPError => e
    Rails.logger.info("Error shortening URL: #{url} because #{e}")
  end

  def listen(m)
    short_urls = URI.extract(m.message, ['http', 'https']).map {|url| shorten(url) }.compact

    if short_urls.present?
      Rails.logger.info("URLs detected and shortened!")
      m.reply(short_urls.join(', '))
    end
  end
end
