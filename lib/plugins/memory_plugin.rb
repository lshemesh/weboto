class MemoryPlugin
  include Cinch::Plugin

  match /remember (.+) (.+)/, method: :remember
  match /recall (.+)/, method: :recall

  def remember(m, term, definition)
    store = MemoryStore.new(m, term)
    if store.add_definition(definition)
      m.user.send "Ok"
    else
      m.user.send "Trouble remembering your definition..."
    end
  end

  def recall(m, term)
    store = MemoryStore.new(m, term)

    if store.definitions.present?
      m.channel.send "I think #{term} means: "
      store.definitions.each_with_index do |definition, index|
        m.channel.send "[#{index}] #{definition}"
      end
    else
      m.user.send "I don't think I know what #{term} means..."
    end
  end
end
