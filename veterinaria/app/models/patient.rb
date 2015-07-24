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
  
  validates :name, :color, :birthday, :sex, :client_id, :weight, presence: true
  
end
