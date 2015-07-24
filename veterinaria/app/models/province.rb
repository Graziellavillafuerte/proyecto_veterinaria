# == Schema Information
#
# Table name: provinces
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Province < ActiveRecord::Base
    has_many :districts
  belongs_to :department
end
