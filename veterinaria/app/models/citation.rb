# == Schema Information
#
# Table name: citations
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  observation :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Citation < ActiveRecord::Base
    has_and_belongs_to_many :services
    
    validates_presence_of :date, :message => '^ Seleccione una fecha'
    validates_presence_of :time, :message => '^ Seleccione una hora'
end
