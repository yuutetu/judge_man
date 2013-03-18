require "spec_helper"

describe SubmitsController do
  describe "routing" do

    it "routes to #new" do
      get("/judges/1/submits/new").should route_to("submits#new", :judge_id => '1')
    end

    it "routes to #create" do
      post("/judges/1/submits").should route_to("submits#create", :judge_id => '1')
    end

  end
end
