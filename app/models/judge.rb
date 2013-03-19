class Judge < ActiveRecord::Base

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
end
