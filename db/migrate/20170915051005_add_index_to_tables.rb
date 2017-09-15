class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :item_form_metaelements, :item_id
    add_index :item_form_metaelements, :crf_info_id
    add_index :item_form_metaelements, :section_id
    add_index :item_form_metaelements, :parent_id
    add_index :item_form_metaelements, :item_group_id
    add_index :item_group_metaelements, :item_group_id
    add_index :item_group_metaelements, :item_id
    add_index :item_group_metaelements, :crf_info_id
    add_index :item_value_orders, :patient_id
    add_index :item_value_orders, :crf_info_id
    add_index :item_value_orders, :menus_crf_info_id
    add_index :item_value_orders, :user_id
    add_index :item_value_orders, :patient_visit_id
    add_index :item_value_orders, :ordinal
  end
end
