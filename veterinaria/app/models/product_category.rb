# == Schema Information
#
# Table name: product_categories
#
#  id          :integer          not null, primary key
#  name        :string(60)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductCategory < ActiveRecord::Base
end
