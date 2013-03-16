require 'spec_helper'

describe Airfield do
  it "has a valid factory" do
    FactoryGirl.create(:airfield).should be_valid
  end
end
