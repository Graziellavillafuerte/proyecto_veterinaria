# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string(100)
#  cost_price          :decimal(6, 2)
#  sale_price          :decimal(6, 2)
#  long_description    :string(250)
#  observation         :text(65535)
#  product_category_id :integer
#  unit_measure_id     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :unit_measure
  has_many :service_details
  has_many :services, through: :service_details
  
  validates_presence_of :name, :message => '^ Ingrese el nombre del producto.'
  validates_presence_of :cost_price, :message => '^ Ingrese el precio de costo.'
  validates_presence_of :sale_price, :message => '^ Ingrese el precio de venta'
  validates :name, uniqueness: true
  
  delegate :name, :to => :product_category, :prefix => true
  delegate :name, :to => :unit_measure, :prefix => true
end
