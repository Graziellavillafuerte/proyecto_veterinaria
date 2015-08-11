# == Schema Information
#
# Table name: service_order_details
#
#  id               :integer          not null, primary key
#  quantity         :integer
#  service_order_id :integer
#  product_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ServiceOrderDetail < ActiveRecord::Base
  belongs_to :service_order
  belongs_to :product
  
  delegate :name, :to => :product, :prefix => true
  delegate :sale_price, :to => :product, :prefix => true
end
