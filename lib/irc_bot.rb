class IrcBot
  def start
    bot.start
  end

  def bot
    @bot ||= Cinch::Bot.new do |b|
      configure do |c|
        @autovoice   = true

        c.channels        = ["#wework"]
        c.nick            = "weboto"
        c.plugins.plugins = [MemoryPlugin, UptimePlugin, GithubCommitPlugin, UrlShortenerPlugin, HelpPlugin, StatsPlugin, WeatherPlugin]
        c.server          = "irc.freenode.org"
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
