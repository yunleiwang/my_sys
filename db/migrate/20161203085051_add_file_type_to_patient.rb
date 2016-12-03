class AddFileTypeToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :file_type, :string
  end
end
