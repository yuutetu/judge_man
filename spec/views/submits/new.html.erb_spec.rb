require 'spec_helper'

describe "submits/new" do
  before(:each) do
    @judge = assign(:judge, stub_model(Judge, :id => 10))
    assign(:submit, stub_model(Submit).as_new_record)
    @judge.stub!(:select_items).and_return([stub_model(SelectItem, :title => "test")])
    @judge.stub!(:present_etc?).and_return(true)
  end

  it "renders new submit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", judge_submits_path(@judge), "post" do
      assert_select "input[name=?]", "submit[select_item]"
    end
  end
end
