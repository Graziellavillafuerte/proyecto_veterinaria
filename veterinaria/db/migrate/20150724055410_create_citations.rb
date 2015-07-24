class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.date :date
      t.time :time
      t.text :observation

      t.timestamps null: false
    end
  end
end
