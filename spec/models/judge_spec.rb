# coding:utf-8
require 'spec_helper'

describe Judge do
	let!(:now){ DateTime.new(2013, 03, 01, 12, 00, 00) }
	let!(:after_1h){ now + 1.hours }
	let!(:after_2h){ now + 2.hours }
  it "judging, judged, removedを判別できる" do
  	judge = create :judge, judge_time: after_1h, remove_time: after_2h
  	DateTime.stub!(:now).and_return(now)
  	judge.should be_judging
  	judge.should_not be_judged
  	judge.should_not be_removed
  	DateTime.stub!(:now).and_return(after_1h)
  	judge.should_not be_judging
  	judge.should be_judged
  	judge.should_not be_removed
  	DateTime.stub!(:now).and_return(after_2h)
  	judge.should_not be_judging
  	judge.should_not be_judged
  	judge.should be_removed
  end
end
