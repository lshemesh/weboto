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
  end
end
