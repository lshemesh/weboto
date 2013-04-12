require 'spec_helper'

describe HelloPlugin do
  it 'is a cinch plugin' do
    HelloPlugin.should include(Cinch::Plugin)
  end
end
