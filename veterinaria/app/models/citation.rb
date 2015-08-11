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

class Citation < ActiveRecord::Base
    #has_and_belongs_to_many :services
    belongs_to :client
    has_many :citation_details
    has_many :services, :through => :citation_details
    has_one :service_order
    
    validates_presence_of :date, :message => '^ Seleccione una fecha'
    validates_presence_of :time, :message => '^ Seleccione una hora'
    
    delegate :name, :to => :client, :prefix => true
    delegate :firstlastname, :to => :client, :prefix => true
    delegate :secondlastname, :to => :client, :prefix => true
    delegate :email, :to => :client, :prefix => true

    scope :citas_hoy, -> { where("date = ?") }
   
end
