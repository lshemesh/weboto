class GithubCommitFetcher
  include HTTParty
  base_uri 'https://api.github.com'

  attr_reader :repo_path

  def initialize(repo_path)
    @repo_path = repo_path
  end

  def url
    ['', 'repos', repo_path, 'commits'].join('/')
  end

  def commits(since = 5.minutes.ago)
    response = request_commits(since)

    if 200 == response.code
      JSON.parse(response.body).map {|hash| GithubCommit.new(repo_path, hash) }
    else
      Rails.logger.info("Failed (#{response.code}) to get commits for #{repo_path} because: #{response.message}")
      []
    end
  end

  def request_commits(since = 5.minutes.ago)
    Rails.logger.info("Requesting Github commits for repo #{repo_path} since #{since}")
    self.class.get(url, { since: since.xmlschema })
  end
end
