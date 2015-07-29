# == Schema Information
#
# Table name: service_details
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  product_id :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ServiceDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
