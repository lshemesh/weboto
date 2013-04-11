require 'spec_helper'

describe GithubCommitPlugin do
  it 'is a cinch plugin' do
    GithubCommitPlugin.should include(Cinch::Plugin)
  end
end
