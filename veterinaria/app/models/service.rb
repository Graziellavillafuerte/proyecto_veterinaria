# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string(60)
#  price       :decimal(6, 2)
#  observation :text(65535)
#  citation_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ActiveRecord::Base
  #has_and_belongs_to_many :citations
  #belongs_to :citation
  has_many :service_details
  has_many :products, :through => :service_details
  has_many :citation_details
  has_many :citations, :through => :citation_details
  
  validates_presence_of :name, :message => '^ Ingrese el nombre del servicio.'
  validates_presence_of :price, :message => '^ Ingrese el precio del servicio.'
  #validates :name, :price, presence: true
  
  delegate :names, :to => :product, :prefix => true, allow_nil: true
  delegate :product_id, :to => :service_detail, :prefix => true
end
