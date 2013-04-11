require 'spec_helper'

describe TwitterPlugin do
  it 'is a cinch plugin' do
    TwitterPlugin.should include(Cinch::Plugin)
  end
end
