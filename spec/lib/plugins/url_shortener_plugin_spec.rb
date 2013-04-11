require 'spec_helper'

describe UrlShortenerPlugin do
  it 'is a cinch plugin' do
    UrlShortenerPlugin.should include(Cinch::Plugin)
  end
end
