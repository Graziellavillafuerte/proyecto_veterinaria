class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :firstlastname
      t.string :secondlastname
      t.date :birthday
      t.string :direction
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
