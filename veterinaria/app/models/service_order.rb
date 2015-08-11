# == Schema Information
#
# Table name: service_orders
#
#  id          :integer          not null, primary key
#  citation_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ServiceOrder < ActiveRecord::Base
  belongs_to :citation
  has_many :service_order_details
  
  delegate :name, :to => :client, :prefix => true
end
