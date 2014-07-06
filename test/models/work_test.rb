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

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
