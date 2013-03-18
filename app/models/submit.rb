class Submit < ActiveRecord::Base
  belongs_to :select_item
  belongs_to :judge
end
