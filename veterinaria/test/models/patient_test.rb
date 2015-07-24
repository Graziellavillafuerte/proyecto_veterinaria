# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  birthday   :date
#  sex        :string(255)
#  weight     :decimal(10, )
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
