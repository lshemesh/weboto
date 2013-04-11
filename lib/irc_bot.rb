class IrcBot
  def start
    bot.start
  end

  def bot
    @bot ||= Cinch::Bot.new do |b|
      configure do |c|
        c.nick       = "weboto"
        c.server     = "irc.freenode.org"
        c.channels   = ["#wework"]
        @autovoice   = true
      end
    end
  end
end