class CreatePatientVisits < ActiveRecord::Migration
  def change
    create_table :patient_visits do |t|
      t.integer :patient_id
      t.date :visiting_time
      t.string :telephone
      t.string :home_address
      t.string :degree_of_education
      t.string :occupation
      t.string :responsible_doctor
      t.string :person_filing
      t.date :created_date
      t.string :created_unit
      t.string :marital_status
      t.string :contact_name
      t.string :contact_relationship
      t.string :contact_address
      t.string :contact_phone
      t.string :visit_type
      t.string :patient_source
      t.string :admission_number
      t.date :admission_date
      t.date :discharge_date
      t.string :outpatient_number
      t.string :diagnostic_types
      t.string :diagnostic_degree
      t.string :diagnostic_anoxia
      t.string :other_diseases

      t.timestamps null: false
    end
  end
end
