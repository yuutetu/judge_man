require "spec_helper"

describe JudgesController do
  describe "routing" do

    it "routes to #new" do
      get("/").should route_to("judges#new")
    end

    it "routes to #show" do
      get("/judges/1").should route_to("judges#show", :id => "1")
    end

    it "routes to #create" do
      post("/judges").should route_to("judges#create")
    end

  end
end
