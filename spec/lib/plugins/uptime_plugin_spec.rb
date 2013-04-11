require 'spec_helper'

describe UptimePlugin do
  it 'is a cinch plugin' do
    UptimePlugin.should include(Cinch::Plugin)
  end
end
