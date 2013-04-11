require 'spec_helper'

describe MemoryEntry do
  let(:memory_entry) { FactoryGirl.build(:memory_entry) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe '#valid?' do
    context 'given valid attributes' do
      it 'validates' do
        memory_entry.should be_valid
      end
    end
  end
end
