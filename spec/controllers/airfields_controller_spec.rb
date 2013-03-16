require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AirfieldsController do

  # This should return the minimal set of attributes required to create a valid
  # Airfield. As you add validations to Airfield, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AirfieldsController. Be sure to keep this updated too.
  def valid_session
    {}
  end
  

  describe "GET #index" do
    it "should get index" do
      get 'index'
      response.should be_success
    end
  end


  describe "GET new" do
    it "renders the :new template" do
      signed_in_as_a_valid_admin
      get :new, id: @airfield, airfield: FactoryGirl.attributes_for(:airfield)
      response.should render_template :new
    end
  end
  
  describe 'PUT #update' do
  before :each do
    @airfield = FactoryGirl.create(:airfield)
  end
  
    it "locates the requested @airfield" do
      signed_in_as_a_valid_admin
      put :update, id: @airfield, airfield: FactoryGirl.attributes_for(:airfield)
      assigns(:airfield).should eq(@airfield)      
    end
  
    it "changes @airfield's attributes" do
      signed_in_as_a_valid_admin
      put :update, id: @airfield, 
        airfield: FactoryGirl.attributes_for(:airfield, name: "New Airport", city: "Glasgow")
      @airfield.reload
      @airfield.name.should eq("New Airport")
      @airfield.city.should eq("Glasgow")
    end
end
  
  describe 'DELETE #destroy' do
    
    before :each do
      @airfield = FactoryGirl.create(:airfield)
      #post_via_redirect admin_session_path, 'admin[admin@admin.com]' => admin.email, 'admin[password]' => admin.password
    end
  
    it "deletes the airport" do
      signed_in_as_a_valid_admin
      expect{
        delete :destroy, id: @airfield        
      }.to change(Airfield,:count).by(-1)
    end
    
    it "redirects to venues#index" do
      signed_in_as_a_valid_admin
      delete :destroy, id: @airfield
      response.should redirect_to airfields_url
    end
  end

end
