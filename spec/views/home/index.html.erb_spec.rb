require 'spec_helper'

describe "home/index.html.erb" do
  it "renders the statistics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h1", :text => "Welcome to worldwide airport facts!"
  end
end
