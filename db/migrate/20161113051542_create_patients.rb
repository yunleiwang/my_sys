class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :file_number
      t.string :id_number
      t.string :name
      t.string :gender
      t.date :birthday
      t.string :nation
      t.string :native_place

      t.timestamps null: false
    end
  end
end
