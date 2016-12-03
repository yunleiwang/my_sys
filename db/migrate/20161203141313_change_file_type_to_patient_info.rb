class ChangeFileTypeToPatientInfo < ActiveRecord::Migration
  def change
    remove_column :patients, :file_type
    add_column :patients, :file_type, :integer
  end
end
