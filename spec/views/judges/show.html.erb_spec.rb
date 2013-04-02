require 'spec_helper'

describe "judges/show" do
  before(:each) do
    @judge = assign(:judge, stub_model(Judge,
      :title => "Title",
      :result => stub_model(SelectItem, :title=>"Title1")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Title1/)
  end
end
