# == Schema Information
#
# Table name: service_order_details
#
#  id               :integer          not null, primary key
#  quantity         :integer
#  service_order_id :integer
#  product_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ServiceOrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
