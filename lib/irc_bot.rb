class IrcBot
  def start
    bot.start
  end

  def bot
    @bot ||= Cinch::Bot.new do |b|
      configure do |c|
        @autovoice   = true
        c.channels   = ["#wework"]
        c.plugins.plugins = [
                             GithubCommitPlugin,
                             HelloPlugin,
                             HelpPlugin,
                             MemoryPlugin,
                             StatsPlugin,
                             TwitterPlugin,
                             UptimePlugin,
                             UrlShortenerPlugin,
                             WeatherPlugin
                            ]

        c.realname        = "Mr. Weboto, the WeWork IRC bot: https://github.com/WeWork/weboto"
        c.server          = "irc.freenode.org"
        if Rails.env.development?
          c.nick          = "weboto-dev"
        else
          c.nick          = "weboto"
        end
      end
    end
  end

  def inspect
    [
     "#<IrcBot:#{object_id} ",
     "bot:#{bot} ",
     ">"
    ].join('')
  end
end
