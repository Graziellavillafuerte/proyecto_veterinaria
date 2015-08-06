# == Schema Information
#
# Table name: citation_details
#
#  id          :integer          not null, primary key
#  quantity    :integer
#  amount      :decimal(6, 2)
#  citation_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  service_id  :integer
#

class CitationDetail < ActiveRecord::Base
  belongs_to :citation
  belongs_to :client
  belongs_to :service
  
  delegate :name, :to => :service, :prefix => true
  delegate :name, :to => :client, :prefix => true
end
