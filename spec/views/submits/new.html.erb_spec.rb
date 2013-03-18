require 'spec_helper'

describe "submits/new" do
  before(:each) do
    assign(:submit, stub_model(Submit,
      :select_item => nil,
      :judge => nil
    ).as_new_record)
  end

  it "renders new submit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submits_path, "post" do
      assert_select "input#submit_select_item[name=?]", "submit[select_item]"
      assert_select "input#submit_judge[name=?]", "submit[judge]"
    end
  end
end
