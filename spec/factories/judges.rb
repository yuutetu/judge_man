# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :judge do
    title "MyString"
    select_type 1
    judge_type 1
    judge_time "2013-03-19 15:39:46"
    remove_time "2013-03-19 15:39:46"
  end
end
