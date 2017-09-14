class AddColumnsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :first_admission_date, :date
    add_column :patients, :family_name, :string
    add_column :patients, :contact_phone, :string
  end
end
