# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
	has_many :users
	has_many :projects

	validates :name, length: { minimum: 5 }

	def to_s
		name
	end
end
