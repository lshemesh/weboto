require 'spec_helper'

describe TwitterStatusFetcher do
  it 'includes HTTParty' do
    TwitterStatusFetcher.should include(HTTParty)
  end
end
