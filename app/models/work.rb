# == Schema Information
#
# Table name: works
#
#  id                :integer          not null, primary key
#  project_id        :integer
#  user_id           :integer
#  datetimeperformed :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  hours             :integer
#

class Work < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	validates :hours, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 8 }
	validates :user, presence: true
	validates :datetimeperformed, presence: true
	validates :project, presence: true
	
	validate :date_is_in_past



	# u can use for cover_photo
	scope :fullday, -> { where('hours >= 8') }
	#scope :recent, -> { where("datetimeperformed > '#{Time.now - 7.days}'")}

	def self.recentdays(num_days_ago)
		since_date = Time.now - num_days_ago.to_i.days
		where("datetimeperformed > '#{since_date}'")
	end

	def to_s
		datetimeperformed.strftime('%m/%d/%Y %H:%M')
	end

	def date_is_in_past
		if datetimeperformed.present? && datetimeperformed > Time.now
			errors.add(:datetimeperformed, "Date cant be in the future.")
	  end
	end
end
