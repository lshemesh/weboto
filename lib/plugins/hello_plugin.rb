class HelloPlugin
  include Cinch::Plugin

  match /(hi|hello|hey|yo|ahoy)/, use_prefix: false

  def execute(m, greeting)
    m.reply("#{m.user.nick}: #{greeting}!")
  end
end
