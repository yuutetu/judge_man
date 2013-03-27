class Judge < ActiveRecord::Base
  validates :select_type, :inclusion => { :in => [0, 1] }
  validates :judge_type, :inclusion => { :in => [0, 1] }
  has_many :select_items

	def judging?
		DateTime.now < self.judge_time
	end

	def judged?
		now = DateTime.now
		self.judge_time <= now && now < self.remove_time
	end

	def removed?
		self.remove_time <= DateTime.now
	end

  def select_items= st
    ar = st.split(",").delete_if{|e| e.blank?}
    super []
    ar.each do |e|
      self.select_items << (SelectItem.create :title => e)
    end
    self.select_items
  end
end
