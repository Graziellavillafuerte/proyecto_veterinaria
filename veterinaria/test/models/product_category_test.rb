# == Schema Information
#
# Table name: product_categories
#
#  id          :integer          not null, primary key
#  name        :string(60)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
