require 'spec_helper'

describe StatsPlugin do
  it 'is a cinch plugin' do
    StatsPlugin.should include(Cinch::Plugin)
  end
end
