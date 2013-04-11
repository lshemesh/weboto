namespace :irc do
  desc "Fire up Weboto!"
  task :start => :environment do
    Rails.logger.info("Starting warp drive")
    bot = IrcBot.new
    Rails.logger.info("Created irc bot: #{bot.inspect}")
    Rails.logger.info("Starting IRC bot")
    bot.start
  end
end
