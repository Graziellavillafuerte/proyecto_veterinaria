class RemoveClientFromCitations < ActiveRecord::Migration
  def change
    #remove_reference :citations, :client_id, index: true, foreign_key: true
    #remove_foreign_key :citations, :client
    #remove_column :citations, :client_id
  end
end
