require 'spec_helper'

describe KelvinConverter do
  {
    255.928 => 1,
    310.928 => 100,
    283.15  => 50
  }.each do |kelvin, fahrenheit|
    context "given #{kelvin} degrees kelvin" do
      it "returns #{fahrenheit}" do
        KelvinConverter.new(kelvin).fahrenheit.should == fahrenheit
      end
    end
  end
end
