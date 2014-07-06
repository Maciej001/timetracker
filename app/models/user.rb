# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fname      :string(255)
#  lname      :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :projects, through: :works

	validates :fname, length: { minimum: 2 }
	validates :lname, length: { minimum: 5 }
	validates :company, presence: true

	def to_s
		"#{fname} #{lname}"
	end
end
