class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :color
      t.date :birthday
      t.string :sex
      t.decimal :weight
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
