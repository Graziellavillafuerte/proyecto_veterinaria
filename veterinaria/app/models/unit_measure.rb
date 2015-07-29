# == Schema Information
#
# Table name: unit_measures
#
#  id         :integer          not null, primary key
#  short_name :string(5)
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UnitMeasure < ActiveRecord::Base
end
