class ChangePatientVisitToObserve < ActiveRecord::Migration
  def change
    rename_column :observes, :patient_visit, :patient_visit_id
  end
end
