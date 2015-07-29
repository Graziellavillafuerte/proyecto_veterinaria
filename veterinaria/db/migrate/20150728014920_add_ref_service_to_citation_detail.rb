class AddRefServiceToCitationDetail < ActiveRecord::Migration
  def change
    add_reference :citation_details, :service, index: true, foreign_key: true
  end
end
