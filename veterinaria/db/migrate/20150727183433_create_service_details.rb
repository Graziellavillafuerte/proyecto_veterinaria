class CreateServiceDetails < ActiveRecord::Migration
  def change
    create_table :service_details do |t|
      t.integer :quantity
      t.references :product, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
