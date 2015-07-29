class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 100
      t.decimal :cost_price, precision: 6, scale: 2
      t.decimal :sale_price, precision: 6, scale: 2
      t.string :long_description, limit: 250
      t.text :observation
      t.references :product_category, index: true, foreign_key: true
      t.references :unit_measure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
