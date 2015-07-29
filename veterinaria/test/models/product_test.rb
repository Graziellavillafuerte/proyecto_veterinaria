# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string(100)
#  cost_price          :decimal(6, 2)
#  sale_price          :decimal(6, 2)
#  long_description    :string(250)
#  observation         :text(65535)
#  product_category_id :integer
#  unit_measure_id     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
