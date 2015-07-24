# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  firstlastname  :string(255)
#  secondlastname :string(255)
#  birthday       :date
#  direction      :string(255)
#  phone          :string(255)
#  email          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
