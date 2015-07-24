class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name, limit: 60
      t.string :description

      t.timestamps null: false
    end
  end
end
