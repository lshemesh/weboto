require 'spec_helper'

describe HelpPlugin do
  it 'is a cinch plugin' do
    HelpPlugin.should include(Cinch::Plugin)
  end
end
