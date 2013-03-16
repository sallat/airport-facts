require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :rating => 1.5,
      :review => "MyText",
      :user_id => 1,
      :airfield_id => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path, :method => "post" do
      assert_select "textarea#review_review", :name => "review[review]"
      assert_select "input#review_user_id", :name => "review[user_id]"
      assert_select "input#review_airfield_id", :name => "review[airfield_id]"
    end
  end
end
