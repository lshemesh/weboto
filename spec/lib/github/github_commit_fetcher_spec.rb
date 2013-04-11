require 'spec_helper'

describe GithubCommitFetcher do
  let(:repo_path) { 'bullshit/repo' }
  let(:github_commit_fetcher) { GithubCommitFetcher.new(repo_path) }

  it 'includes HTTParty' do
    GithubCommitFetcher.should include(HTTParty)
  end

  describe '#url' do
    it 'returns a correctly formatted url' do
      github_commit_fetcher.url.should == '/repos/bullshit/repo/commits'
    end
  end
end
