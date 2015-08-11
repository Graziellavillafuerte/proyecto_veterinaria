class CreateServiceOrders < ActiveRecord::Migration
  def change
    create_table :service_orders do |t|
      t.references :citation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
