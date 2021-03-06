# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ActiveRecord::Base
    has_many :provinces
    
    validates_presence_of :name, :message => '^ Ingrese nombre de departamento.'
end
