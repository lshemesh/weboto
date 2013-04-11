require 'spec_helper'

describe MemoryStore do
  let(:definition) { "Definition text!" }
  let(:m) { double("message", :user => user) }
  let(:memory_store) { MemoryStore.new(m, term) }
  let(:term) { "Panda" }
  let(:user) { double('irc user', :send => true) }

  describe '#memory_entry' do
    context 'given no memory entry of that name' do
      it 'creates a memory entry of that name' do
        query = MemoryEntry.where(:name => term)

        lambda {
          memory_store.memory_entry
        }.should change(query, :count).by(1)
      end
    end

    context 'given a memory entry of that name' do
      it 'returns memory entry of that name' do
        MemoryEntry.create!(:name => term)
        query = MemoryEntry.where(:name => term)

        lambda {
          5.times { memory_store.memory_entry }
        }.should change(query, :count).by(0)
      end
    end
  end

  describe '#add_definition' do
    context 'given no memory definition for that name and definition' do
      it 'creates the definition' do
        lambda {
          memory_store.add_definition(definition)
        }.should change(MemoryDefinition.where(:name => definition), :count).by(1)
      end
    end

    context 'given a memory definition for that term' do
      it 'returns the definition' do
        FactoryGirl.create(:memory_definition, :name => definition, :memory_entry => memory_store.memory_entry)

        lambda {
          memory_store.add_definition(definition)
        }.should change(MemoryDefinition.where(:name => definition), :count).by(0)
      end
    end
  end

  describe '#definitions' do
    context 'given definitions' do
      it 'returns them' do
        memory_store.add_definition(definition)
        memory_store.definitions.length.should == 1
      end
    end

    context 'given no definitions' do
      it 'returns an empty array' do
        memory_store.definitions.should == []
      end
    end
  end
end
