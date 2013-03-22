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
      assert_select "input#judge_select_type_0[name=?]", "judge[select_type]"
      assert_select "input#judge_select_type_1[name=?]", "judge[select_type]"
      assert_select "input#judge_judge_type_0[name=?]", "judge[judge_type]"
      assert_select "input#judge_judge_type_1[name=?]", "judge[judge_type]"
      assert_select "select#judge_judge_time_1i[name=?]", "judge[judge_time(1i)]"
      assert_select "select#judge_judge_time_2i[name=?]", "judge[judge_time(2i)]"
      assert_select "select#judge_judge_time_3i[name=?]", "judge[judge_time(3i)]"
      assert_select "select#judge_judge_time_4i[name=?]", "judge[judge_time(4i)]"
      assert_select "select#judge_judge_time_5i[name=?]", "judge[judge_time(5i)]"
      assert_select "select#judge_remove_time_1i[name=?]", "judge[remove_time(1i)]"
      assert_select "select#judge_remove_time_2i[name=?]", "judge[remove_time(2i)]"
      assert_select "select#judge_remove_time_3i[name=?]", "judge[remove_time(3i)]"
      assert_select "select#judge_remove_time_4i[name=?]", "judge[remove_time(4i)]"
      assert_select "select#judge_remove_time_5i[name=?]", "judge[remove_time(5i)]"
    end
  end
end
