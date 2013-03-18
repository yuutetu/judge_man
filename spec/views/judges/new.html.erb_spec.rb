require 'spec_helper'

describe "judges/new" do
  before(:each) do
    assign(:judge, stub_model(Judge,
      :title => "MyString",
      :select_type => 1,
      :judge_type => 1
    ).as_new_record)
  end

  it "renders new judge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", judges_path, "post" do
      assert_select "input#judge_title[name=?]", "judge[title]"
      assert_select "input#judge_select_type[name=?]", "judge[select_type]"
      assert_select "input#judge_judge_type[name=?]", "judge[judge_type]"
    end
  end
end
