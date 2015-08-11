class CreateServiceOrderDetails < ActiveRecord::Migration
  def change
    create_table :service_order_details do |t|
      t.integer :quantity
      t.references :service_order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
