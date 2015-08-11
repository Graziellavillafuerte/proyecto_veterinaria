class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.datetime :date
      t.string :name
      t.string :lastname
      t.string :secondlastname
      t.string :email, limit: 100
      t.integer :state
      t.string :subject

      t.timestamps null: false
    end
  end
end
