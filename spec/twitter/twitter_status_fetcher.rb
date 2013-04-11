require 'spec_helper'

describe TwitterStatusFetcher do

  it "includes HTTParty" do
    self.should include(HTTParty)
  end

end