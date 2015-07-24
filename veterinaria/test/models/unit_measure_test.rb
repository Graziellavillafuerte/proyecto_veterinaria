# == Schema Information
#
# Table name: unit_measures
#
#  id          :integer          not null, primary key
#  short_name  :string(5)
#  name        :string(30)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UnitMeasureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
