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

class Patient < ActiveRecord::Base
  belongs_to :client
  
  #validates :name, :color, :birthday, :sex, :client_id, :weight, presence: true
  validates_presence_of :name, :message => '^ Ingrese el nombre del paciente.'
  validates_presence_of :color, :message => '^ Ingrese el color del paciente.'
  validates_presence_of :birthday, :message => '^ Ingrese la fecha de nacimiento.'
  validates_presence_of :weight, :message => '^ Ingrese el peso del paciente.'
  #validates_presence_of :client_id, :message => '^ Seleccione cliente.'
  

  
  
  delegate :name, :to => :client, :prefix => true
  delegate :firstlastname, :to => :client, :prefix => true
  delegate :secondlastname, :to => :client, :prefix => true
end
