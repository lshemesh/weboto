class TwitterStatusFetcher
  include HTTParty
  base_uri 'https://api.twitter.com/1'

  def statuses(url)
    self.class.get('/statuses/user_timeline?include_entities=true&include_rts=true&screen_name=WeWork&count=2') 
  end

end
