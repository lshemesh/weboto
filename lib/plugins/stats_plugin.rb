class StatsPlugin
  include Cinch::Plugin

  match /stats/

  def execute(m)
    m.reply "Up since #{UP_SINCE.to_formatted_s} with #{MemoryEntry.count} topics (#{MemoryDefinition.count} separate definitions) in my DB"
  end
end
