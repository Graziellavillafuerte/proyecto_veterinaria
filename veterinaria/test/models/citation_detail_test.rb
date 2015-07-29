# == Schema Information
#
# Table name: citation_details
#
#  id          :integer          not null, primary key
#  quantity    :integer
#  amount      :decimal(6, 2)
#  citation_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  service_id  :integer
#

require 'test_helper'

class CitationDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
