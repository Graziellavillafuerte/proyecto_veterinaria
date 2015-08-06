class AddDefaultToCitation < ActiveRecord::Migration
  def up
    change_column :citations, :state, :integer, default: 1
  end

  def down
    change_column :citations, :state, :integer
  end
end
