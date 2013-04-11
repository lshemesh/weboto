class TwitterStatusFetcher
  include HTTParty
  base_uri 'https://api.twitter.com/1'

  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  def statuses(count = 1)
    response = request_statuses(count)

    if 200 == response.code
      JSON.parse(response.body).map {|hash| TwitterStatus.new(handle, hash) }
    else
      Rails.logger.info("Failed (#{response.code}) to get tweets for #{handle} because: #{response.message}")
      []
    end
  end

  def request_statuses(count = 1)
    Rails.logger.info("Requesting Twitter statuses for user #{handle}")
    self.class.get('statuses/user_timeline.json', { :query => {
                       :screen_name => 'WeWork',
                       :count => count
                     }
                   })
  end
end
