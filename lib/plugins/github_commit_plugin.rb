class GithubCommitPlugin
  include Cinch::Plugin

  INTERVAL = 30

  timer INTERVAL, method: :puke_commits

  def puke_commits
    channel = Channel("#wework")

    repo_path = 'WeWork/weboto'

    GithubCommitFetcher.new(repo_path).commits(INTERVAL).each do |commit|
      channel.send commit.formatted_message
    end
  end
end
