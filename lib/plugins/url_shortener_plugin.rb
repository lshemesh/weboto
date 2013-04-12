require 'open-uri'

class UrlShortenerPlugin
  include Cinch::Plugin

  listen_to :channel

  def shorten(url)
    UrlShortener.new(url).short_url
  end

  def listen(m)
    short_urls = URI.extract(m.message, ['http', 'https']).map {|url| shorten(url) }.compact

    if short_urls.present?
      Rails.logger.info("URLs detected and shortened!")
      m.reply(short_urls.join(', '))
    end
  end
end
