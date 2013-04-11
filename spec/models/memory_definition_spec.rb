require 'spec_helper'

describe MemoryDefinition do
  let(:memory_definition) { FactoryGirl.build(:memory_definition) }

  it { should validate_presence_of(:memory_entry) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:memory_entry) }

  describe '#valid?' do
    context 'given valid attributes' do
      it 'validates' do
        memory_definition.should be_valid
      end
    end
  end
end
