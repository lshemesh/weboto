class UptimePlugin
  include Cinch::Plugin

  match /uptime\z/

  def execute(m)
    m.reply "Up since #{UP_SINCE}"
  end
end
