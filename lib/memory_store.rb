class MemoryStore
  attr_reader :term

  def initialize(term)
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

  def forget
    memory_entry.destroy
  end
end
