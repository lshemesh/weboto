class MemoryPlugin
  include Cinch::Plugin

  QUESTION_MARK_REGEX = /\?\b(\w+)\b/

  match /remember (\S+) (.+)/, method: :remember
  match /recall (.+)/, method: :recall
  match /forget (.+)/, method: :forget
  match QUESTION_MARK_REGEX, method: :recall, use_prefix: false

  def remember(m, term, definition)
    store = MemoryStore.new(term)
    if store.add_definition(definition)
      respond_to_user(m, "Ok")
    else
      respond_to_user(m, "Trouble remembering your definition...")
    end
  end

  def recall(m, term)
    store = MemoryStore.new(term)

    if store.definitions.present?
      m.channel.send "I think #{term} means: "
      store.definitions.each_with_index do |definition, index|
        m.channel.send "[#{index}] #{definition.name}"
      end
    else
      respond_to_user(m, "I don't think I know what #{term} means...")
    end
  end

  def forget(m, term)
    store = MemoryStore.new(term)
    store.forget
    respond_to_user(m, "Forgetting #{term}...")
  end

  def respond_to_user(m, msg)
    m.channel.send [m.user.nick, msg].join(': ')
  end
end
