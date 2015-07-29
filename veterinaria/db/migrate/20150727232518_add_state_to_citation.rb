class AddStateToCitation < ActiveRecord::Migration
  def change
    add_column :citations, :state, :integer
  end
end
