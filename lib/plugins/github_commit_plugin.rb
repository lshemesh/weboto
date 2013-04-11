class GithubCommitPlugin
  include Cinch::Plugin

  timer 30, method: :puke_commits

  def puke_commits
    channel = Channel("#wework")

    repo_path = 'WeWork/weboto'

    GithubCommitFetcher.new(repo_path).commits.each do |commit|
      channel.send commit.formatted_message
    end
  end
end
