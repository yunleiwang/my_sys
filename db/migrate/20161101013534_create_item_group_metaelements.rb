class CreateItemGroupMetaelements < ActiveRecord::Migration
  def change
    create_table :item_group_metaelements do |t|
      t.string :no
      t.string :parentno
      t.integer :item_group_id
      t.integer :crf_info_id
      t.string :header
      t.string :subheader
      t.integer :repeat_number
      t.integer :repeat_max
      t.integer :item_id
      t.integer :seq
      t.boolean :show_group
      t.boolean :repeating_group
      t.string :options_index

      t.timestamps null: false
    end
  end
end
