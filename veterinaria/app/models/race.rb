# == Schema Information
#
# Table name: races
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Race < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :name, :message => '^ Ingrese la raza.'
end
