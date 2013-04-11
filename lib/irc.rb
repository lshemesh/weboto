class IrcBot
  def initialize
    @bot ||= Cinch::Bot.new do |b|
      configure do |c|
        c.nick       = "weboto"
        c.server     = "irc.freenode.org"
        c.channels   = ["#wework"]
      end
    end
  end
end