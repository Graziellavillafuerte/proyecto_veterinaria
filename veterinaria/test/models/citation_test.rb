# == Schema Information
#
# Table name: citations
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  observation :text(65535)
#  client_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :integer          default(1)
#

require 'test_helper'

class CitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
