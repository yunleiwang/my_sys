class CreateItemValueOrders < ActiveRecord::Migration
  def change
    create_table :item_value_orders do |t|
      t.integer :patient_id
      t.integer :patient_visit_id
      t.float :complete
      t.integer :ordinal
      t.integer :user_id
      t.integer :history
      t.integer :status
      t.integer :crf_info_id
      t.integer :menus_crf_info_id

      t.timestamps null: false
    end
  end
end
