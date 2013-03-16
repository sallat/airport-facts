require "spec_helper"

describe AirfieldsController do
  describe "routing" do

    it "routes to #index" do
      get("/airfields").should route_to("airfields#index")
    end

    it "routes to #new" do
      get("/airfields/new").should route_to("airfields#new")
    end

    it "routes to #show" do
      get("/airfields/1").should route_to("airfields#show", :id => "1")
    end

    it "routes to #edit" do
      get("/airfields/1/edit").should route_to("airfields#edit", :id => "1")
    end

    it "routes to #create" do
      post("/airfields").should route_to("airfields#create")
    end

    it "routes to #update" do
      put("/airfields/1").should route_to("airfields#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/airfields/1").should route_to("airfields#destroy", :id => "1")
    end

  end
end
