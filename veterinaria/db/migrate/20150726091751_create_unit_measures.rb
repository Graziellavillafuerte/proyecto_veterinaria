class CreateUnitMeasures < ActiveRecord::Migration
  def change
    create_table :unit_measures do |t|
      t.string :short_name, limit: 5
      t.string :name, limit: 40

      t.timestamps null: false
    end
  end
end
