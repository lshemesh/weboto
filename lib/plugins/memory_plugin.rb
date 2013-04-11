class MemoryPlugin
  include Cinch::Plugin

  match /!remember (.+?) (.+?)/

  def execute(m, term, definition)
    MemoryStore.new(m, term).add_definition(definition)
  end
end
