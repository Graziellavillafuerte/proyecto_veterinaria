# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string(60)
#  price       :decimal(10, )
#  observation :text(65535)
#  citation_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ActiveRecord::Base
  has_and_belongs_to_many :citations
  #belongs_to :citation
  
  validates_presence_of :name, :message => '^ Ingrese el nombre del servicio.'
  validates_presence_of :price, :message => '^ Ingrese el precio del servicio.'
  #validates :name, :price, presence: true
end
