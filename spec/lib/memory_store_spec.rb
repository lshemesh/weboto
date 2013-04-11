require 'spec_helper'

describe MemoryStore do
  let(:term) { "Panda" }
  let(:m) { double("message") }
  let(:memory_store) { MemoryStore.new(m, term) }

  describe '#memory_entry' do
    context 'given no memory entry of that name' do
      it 'creates a memory entry of that name' do
        query = MemoryEntry.where(:name => term)

        lambda {
          memory_store.memory_entry
        }.should change(query, :count).by(1)
      end
    end

    context 'given no memory entry of that name' do
      it 'returns memory entry of that name' do
        MemoryEntry.create!(:name => term)
        query = MemoryEntry.where(:name => term)

        lambda {
          5.times { memory_store.memory_entry }
        }.should change(query, :count).by(0)
      end
    end
  end
end
