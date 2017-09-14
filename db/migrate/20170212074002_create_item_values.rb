class CreateItemValues < ActiveRecord::Migration
  def change
    create_table :item_values do |t|
      t.integer :item_id
      t.text :value
      t.integer :patient_id
      t.integer :menus_crf_info_id
      t.integer :patient_visit_id
      t.integer :item_value_order_id

      t.timestamps null: false
    end
  end
end
