require 'spec_helper'

describe TwitterStatus do
  let(:handle) { 'WeWork' }
  let(:attributes) do
    {"created_at"=>"Thu Apr 11 19:23:17 +0000 2013",
      "id"=>322429664956137500,
      "id_str"=>"322429664956137472",
      "text"=>
      "ZOMG Message!",
      "source"=>
      "<a href=\"http://www.hootsuite.com\" rel=\"nofollow\">HootSuite</a>",
      "truncated"=>false,
      "in_reply_to_status_id"=>322427616466460700,
      "in_reply_to_status_id_str"=>"322427616466460672",
      "in_reply_to_user_id"=>2063921,
      "in_reply_to_user_id_str"=>"2063921",
      "in_reply_to_screen_name"=>"justex07",
      "user"=>
      {"id"=>111092283,
        "id_str"=>"111092283",
        "name"=>"WeWork",
        "screen_name"=>"WeWork",
        "location"=>"NYC / SF / LA",
        "url"=>"http://wework.com",
        "description"=>
        "WeWork empowers collaboration among a membership of creative businesses and entrepreneurs by providing boutique office space and cultivating a growing network.",
        "protected"=>false,
        "followers_count"=>2222,
        "friends_count"=>312,
        "listed_count"=>67,
        "created_at"=>"Wed Feb 03 19:55:58 +0000 2010",
        "favourites_count"=>16,
        "utc_offset"=>-18000,
        "time_zone"=>"Eastern Time (US & Canada)",
        "geo_enabled"=>false,
        "verified"=>false,
        "statuses_count"=>1720,
        "lang"=>"en",
        "contributors_enabled"=>false,
        "is_translator"=>false,
        "profile_background_color"=>"000000",
        "profile_background_image_url"=>
        "http://a0.twimg.com/profile_background_images/201410225/background.jpg",
        "profile_background_image_url_https"=>
        "https://si0.twimg.com/profile_background_images/201410225/background.jpg",
        "profile_background_tile"=>false,
        "profile_image_url"=>
        "http://a0.twimg.com/profile_images/2725990349/5ee0f217f9eb65010b7727a47afdede9_normal.png",
        "profile_image_url_https"=>
        "https://si0.twimg.com/profile_images/2725990349/5ee0f217f9eb65010b7727a47afdede9_normal.png",
        "profile_link_color"=>"FF00FF",
        "profile_sidebar_border_color"=>"262727",
        "profile_sidebar_fill_color"=>"383838",
        "profile_text_color"=>"000000",
        "profile_use_background_image"=>true,
        "default_profile"=>false,
        "default_profile_image"=>false,
        "following"=>nil,
        "follow_request_sent"=>nil,
        "notifications"=>nil},
      "geo"=>nil,
      "coordinates"=>nil,
      "place"=>nil,
      "contributors"=>nil,
      "retweet_count"=>0,
      "favorite_count"=>0,
      "entities"=>
      {"hashtags"=>[],
        "urls"=>[],
        "user_mentions"=>
        [{"screen_name"=>"justex07",
           "name"=>"Justin Scott",
           "id"=>2063921,
           "id_str"=>"2063921",
           "indices"=>[0, 9]}]},
      "favorited"=>false,
      "retweeted"=>false,
      "lang"=>"en"}
  end

  let(:twitter_status) { TwitterStatus.new(handle, attributes) }

  it 'blah' do
    twitter_status
  end

  describe '#formatted_status' do
    it 'outputs a nicely-formatted representation of the status' do
      twitter_status.formatted_status.should == "@WeWork: ZOMG Message! => Thu Apr 11 19:23:17 +0000 2013"
    end
  end

  describe '#screen_name' do
    it 'returns the username' do
      twitter_status.screen_name.should == 'WeWork'
    end
  end

  describe '#text' do
    it 'returns the status text' do
      twitter_status.text.should == 'ZOMG Message!'
    end
  end

  describe '#time' do
    it 'returns the time' do
      twitter_status.time.should == "Thu Apr 11 19:23:17 +0000 2013"
    end
  end
end
