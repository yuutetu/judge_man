require 'spec_helper'

describe "judges/edit" do
  before(:each) do
    @judge = assign(:judge, stub_model(Judge,
      :title => "MyString",
      :select_type => 1,
      :judge_type => 1
    ))
  end

  it "renders the edit judge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", judge_path(@judge), "post" do
      assert_select "input#judge_title[name=?]", "judge[title]"
      assert_select "input#judge_select_type[name=?]", "judge[select_type]"
      assert_select "input#judge_judge_type[name=?]", "judge[judge_type]"
    end
  end
end
