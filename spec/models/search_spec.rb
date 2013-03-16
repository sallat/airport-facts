require 'spec_helper'

describe Search do
  it "has a valid factory" do
    FactoryGirl.create(:search).should be_valid
  end
  
  it "is valid without a name" do
    FactoryGirl.build(:search, :name => nil).should be_valid
  end
  
end