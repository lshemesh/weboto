class TwitterPlugin
  include Cinch::Plugin

  INTERVAL = 90
  timer INTERVAL, method: :get_statuses

  attr_reader :repo_path

  def get_statuses(m, url)
    channel = Channel("#wework")

    ['WeWork/weboto'].each do |repo_path|
      Rails.logger.info("Fetching Twitter Statuses #{repo_path}")
      statuses = TwitterStatusFetcher.new.statuses(INTERVAL.seconds.ago)

      statuses.each do |status|
        channel.send status
      end
    end
  end

end