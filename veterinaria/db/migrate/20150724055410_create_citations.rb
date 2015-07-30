class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.date :date
      t.time :time
      t.text :observation
      t.references :client, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
