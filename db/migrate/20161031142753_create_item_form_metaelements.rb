class CreateItemFormMetaelements < ActiveRecord::Migration
  def change
    create_table :item_form_metaelements do |t|
      t.string :no
      t.string :parentno
      t.integer :item_id
      t.integer :crf_info_id
      t.integer :section_id
      t.string :header
      t.string :subheader
      t.integer :parent_id
      t.integer :ordinal
      t.boolean :required
      t.boolean :show_item
      t.string :trigger
      t.string :options_index
      t.integer :item_group_id

      t.timestamps null: false
    end
  end
end
