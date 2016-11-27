class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :units
      t.string :header
      t.string :left_item_text
      t.string :right_item_text
      t.boolean :phi_status
      t.string :item_data_type
      t.string :response_type
      t.string :options_text
      t.string :options_value
      t.string :default_value
      t.string :regexp
      t.string :regexp_error_msg

      t.timestamps null: false
    end
  end
end
