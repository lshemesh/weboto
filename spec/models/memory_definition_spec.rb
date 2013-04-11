require 'spec_helper'

describe MemoryDefinition do
  it { should validate_presence_of(:memory_entry) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:memory_entry) }
end
