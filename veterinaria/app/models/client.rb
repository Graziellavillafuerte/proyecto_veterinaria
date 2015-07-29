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

class Client < ActiveRecord::Base
    has_many :patients
    has_many :citations
    
    
    #validates :name, :firstlastname, :secondlastname, :birthday, presence: true
    validates_presence_of :name, :message => '^ Ingrese el nombre del cliente.'
    validates_presence_of :firstlastname, :message => '^ Ingrese apellido paterno.'
    validates_presence_of :secondlastname, :message => '^ Ingrese apellido materno.'
    validates_presence_of :birthday, :message => '^ Seleccione fecha de nacimiento.'
    validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "correo electrónico incorrecto" }
    
end
