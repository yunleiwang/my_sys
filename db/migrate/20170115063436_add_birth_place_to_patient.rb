class AddBirthPlaceToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :birth_place, :string
  end
end
