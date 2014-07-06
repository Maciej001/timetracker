# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  company_id   :integer
#  default_rate :integer
#  created_at   :datetime
#  updated_at   :datetime
#  slug         :string(255)
#

class Project < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :users, through: :works

	validates :name, presence: true
	validates :name, length: { minimum: 2 }
	validates :company, presence: true
	validates :default_rate, numericality: { only_integer: true, greater_than: 50}
	validates :slug, length: { minimum: 3 }
	validates :slug, uniqueness: true


	def to_s
		"#{name} (#{company})"
	end


end
