class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 100
      t.decimal :cost_price
      t.decimal :sale_price
      t.string :long_description, limit: 200
      t.text :observation
      t.references :product_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
