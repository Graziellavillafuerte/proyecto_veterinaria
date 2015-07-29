class AddRefToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :unit_measure, index: true, foreign_key: true
  end
end
