require 'spec_helper'

describe "judges/show" do
  before(:each) do
    @judge = assign(:judge, stub_model(Judge,
      :title => "Title",
      :select_type => 1,
      :judge_type => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
