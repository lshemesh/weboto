require 'spec_helper'

describe WeatherFetcher do

  it 'includes HTTParty' do
    WeatherFetcher.should include(HTTParty)
  end

end
