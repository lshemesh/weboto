require 'spec_helper'

describe MemoryPlugin do
  it 'is a Cinch plugin' do
    MemoryPlugin.should include(Cinch::Plugin)
  end
end
