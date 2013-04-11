class MemoryStore
  attr_reader :m, :term

  def initialize(m, term)
    @m    = m
    @term = term
  end

  def memory_entry
    @memory_entry ||= MemoryEntry.where(:name => term).first_or_create!
  end

  def add_definition(definition)
    memory_entry.memory_definitions.where(:name => definition).first_or_create!
  end

  def definitions
    memory_entry.memory_definitions.order(:created_at)
  end
end
