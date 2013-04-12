class UrlShortener
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def short_url
    Rails.logger.info("Shortening URL #{url}")

    if url.length > 20
      query_url = "http://is.gd/create.php?format=simple&url=#{url}"
      Rails.logger.info("Query URL: #{query_url}")
      url = open(query_url).read
      Rails.logger.info("Got shortened url: #{url}")
      "Error" == url ? nil : url
    else
      Rails.logger.info("URL short enough, not shortening anymore")

      self.url
    end
  rescue OpenURI::HTTPError => e
    Rails.logger.info("Error shortening URL: #{url} because #{e}")
  end
end
