class CreateCitationDetails < ActiveRecord::Migration
  def change
    create_table :citation_details do |t|
      t.integer :quantity
      t.decimal :amount, precision: 6, scale: 2
      t.references :citation, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
