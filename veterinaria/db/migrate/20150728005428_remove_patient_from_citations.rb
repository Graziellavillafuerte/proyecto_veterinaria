class RemovePatientFromCitations < ActiveRecord::Migration
  def change
    remove_reference :citations, :patient_id, index: true, foreign_key: true
    #remove_foreign_key :citations, :patient
    remove_column :citations, :patient_id
  end
end
