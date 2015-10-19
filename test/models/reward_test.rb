# == Schema Information
#
# Table name: rewards
#
#  id                 :integer          not null, primary key
#  project_id         :integer
#  description        :text
#  value              :integer
#  shipping           :decimal(8, 2)
#  number_available   :integer
#  estimated_delivery :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
