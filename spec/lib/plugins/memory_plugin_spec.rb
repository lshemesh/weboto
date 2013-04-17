require 'spec_helper'

describe MemoryPlugin do
  it 'is a Cinch plugin' do
    MemoryPlugin.should include(Cinch::Plugin)
  end

    {
      'leo waz here?'   => false,
      'leo ? waz here'  => false,
      'leo ?waz here'   => 'waz',
      '?leo'            => 'leo',
      'leo'             => false,
      'leo?'            => false,
      '??'              => false,
      '?leo?'           => 'leo'
    }.each do |str, expectation|

    context str do
      subject { str }

      if expectation
        it { should match(MemoryPlugin::QUESTION_MARK_REGEX) }

        it "captures #{expectation}" do
          str =~ MemoryPlugin::QUESTION_MARK_REGEX
          $1.should eq(expectation)
        end
      else
        it { should_not match(MemoryPlugin::QUESTION_MARK_REGEX) }
      end

    end
  end
end
