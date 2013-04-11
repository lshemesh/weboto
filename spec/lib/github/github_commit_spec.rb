require 'spec_helper'

describe GithubCommit do
  let(:repo_name) { 'some_org/some_repo' }
  let(:attributes) do
    {
      "sha" => "decabd0434f0b5393526d46d182eeb36218b182b",
      "commit" => {
        "author" => {
          "name" => "J. Random Hacker",
          "email" => "j.random@wework.com",
          "date" => "2013-04-11T15:01:13Z"
        },
        "committer" => {
          "name" => "J. Random Hacker",
          "email" => "j.random@wework.com",
          "date" => "2013-04-11T15:01:13Z"
        },
        "message" => "ensured valid memory definition factory\n\nSigned-off-by => J. Random Hacker <j.random@wework.com>",
        "tree" => {
          "sha" => "612c6bdc08cdec1e22c09907777c561f76a376a8",
          "url" => "https://api.github.com/repos/some_org/some_repo/git/trees/612c6bdc08cdec1e22c09907777c561f76a376a8"
        },
        "url" => "https://api.github.com/repos/some_org/some_repo/git/commits/decabd0434f0b5393526d46d182eeb36218b182b",
        "comment_count" => 0
      },
      "url" => "https://api.github.com/repos/some_org/some_repo/commits/decabd0434f0b5393526d46d182eeb36218b182b",
      "html_url" => "https://github.com/some_org/some_repo/commit/decabd0434f0b5393526d46d182eeb36218b182b",
      "comments_url" => "https://api.github.com/repos/some_org/some_repo/commits/decabd0434f0b5393526d46d182eeb36218b182b/comments",
      "author" => nil,
      "committer" => nil,
      "parents" => [
                    {
                      "sha" => "61768c4f7a8bcbd5db165c1c3f03db1ba2eb9cba",
                      "url" => "https://api.github.com/repos/some_org/some_repo/commits/61768c4f7a8bcbd5db165c1c3f03db1ba2eb9cba",
                      "html_url" => "https://github.com/some_org/some_repo/commit/61768c4f7a8bcbd5db165c1c3f03db1ba2eb9cba"
                    }
                   ]
    }
  end

  let(:github_commit) { GithubCommit.new(repo_name, attributes) }

  describe '#shorten_sha' do
    it 'shortens the SHA to 8 characters' do
      github_commit.shorten_sha(attributes['sha']).should == 'decabd04'
    end
  end

  describe '#url' do
    it 'returns the html url' do
      github_commit.url.should == "https://github.com/some_org/some_repo/commit/decabd0434f0b5393526d46d182eeb36218b182b"
    end
  end

  describe '#sha' do
    it 'returns the commit hash' do
      github_commit.sha.should == 'decabd0434f0b5393526d46d182eeb36218b182b'
    end
  end

  describe '#author' do
    it 'returns the author name' do
      github_commit.author.should == 'J. Random Hacker'
    end
  end

  describe '#time' do
    it 'returns the time' do
      github_commit.time.should == Time.parse("2013-04-11T15:01:13Z")
    end
  end

  describe '#shorten_url' do
    it 'returns a truncated url' do
      url = "https://github.com/some_org/some_repo/commit/decabd0434f0b5393526d46d182eeb36218b182b"
      github_commit.shorten_url(url).should == "https://github.com/some_org/some_repo/commit/decabd04"
    end
  end

  describe '#formatted_message' do
    it 'makes a nice message' do
      github_commit.formatted_message.should == "commit [decabd04] pushed to some_org/some_repo by J. Random Hacker @ 2013-04-11 15:01:13 UTC => https://github.com/some_org/some_repo/commit/decabd04"
    end
  end
end
