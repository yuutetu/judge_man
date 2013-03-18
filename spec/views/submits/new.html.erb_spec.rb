require 'spec_helper'

describe "submits/new" do
  before(:each) do
    assign(:judge, stub_model(Judge).as_new_record)
    assign(:submit, stub_model(Submit,
      :select_item => nil,
      :judge => nil
    ).as_new_record)
  end

  it "renders new submit form" do
    
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", judge_submits_path(@judge), "post" do
      assert_select "input#submit_select_item[name=?]", "submit[select_item]"
    end
  end
end
