require 'spec_helper'

describe WeatherPlugin do
  it 'is a cinch plugin' do
    WeatherPlugin.should include(Cinch::Plugin)
  end
end
