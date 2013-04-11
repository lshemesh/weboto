require 'spec_helper'

describe TwitterPlugin do

  let(:client) {HTTParty}
  let(:twitter_plugin) {TwitterPlugin}

  it 'is a cinch plugin' do
    twitter_plugin.should include(Cinch::Plugin)
  end

  describe "#statuses" do
    it "should return a list of statuses from WeWork account" do
      expected = ["name" => "WeWork", "id" => 111092283]
      @statuses = twitter_plugin.statuses('https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=WeWork&count=2')
      @statuses[0]["user"].should include *expected
    end
  end

end
