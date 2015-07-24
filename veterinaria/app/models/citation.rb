# == Schema Information
#
# Table name: citations
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  observation :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Citation < ActiveRecord::Base
    has_and_belongs_to_many :services
end
