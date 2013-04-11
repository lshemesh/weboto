class GithubCommitPlugin
  include Cinch::Plugin

  INTERVAL = 30

  timer INTERVAL, method: :puke_commits

  def puke_commits
    Rails.logger.info("Github commit plugin firing")
    channel = Channel("#wework")

    ['WeWork/weboto'].each do |repo_path|
      Rails.logger.info("Fetching Github commits for #{repo_path}")
      GithubCommitFetcher.new(repo_path).commits(INTERVAL.seconds.ago).each do |commit|
        channel.send commit.formatted_message
      end
    end
  end
end
