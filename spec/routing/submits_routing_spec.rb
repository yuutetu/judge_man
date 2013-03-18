require "spec_helper"

describe SubmitsController do
  describe "routing" do

    it "routes to #new" do
      get("/submits/new").should route_to("submits#new")
    end

    it "routes to #create" do
      post("/submits").should route_to("submits#create")
    end

  end
end
