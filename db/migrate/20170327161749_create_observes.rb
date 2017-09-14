class CreateObserves < ActiveRecord::Migration
  def change
    create_table :observes do |t|
      t.date :observe_date
      t.integer :patient_id
      t.integer :patient_visit
      t.integer :observe_hour
      t.string :drug
      t.integer :attack
      t.string :cause
      t.string :sleep_info

      t.timestamps null: false
    end
  end
end
