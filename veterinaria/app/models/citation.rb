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
#  state       :integer
#  client_id   :integer
#

class Citation < ActiveRecord::Base
    #has_and_belongs_to_many :services
    belongs_to :client
    has_many :citation_details
    has_many :services, :through => :citation_details
    
    validates_presence_of :date, :message => '^ Seleccione una fecha'
    validates_presence_of :time, :message => '^ Seleccione una hora'
    
    delegate :name, :to => :patient, :prefix => true
    delegate :name, :to => :service, :prefix => true
    
    def new
      #this will also fix the error you see, although it's fundamentally incorrect
   end
end
