require 'spec_helper'

describe Review do
  it "has a valid factory" do
    FactoryGirl.create(:review).should be_valid
  end
  
  it "is valid without a review" do
    FactoryGirl.build(:review, :review => nil).should be_valid
  end
  
    it "is valid without a rating" do
    FactoryGirl.build(:review, :rating => nil).should be_valid
  end
  
end

