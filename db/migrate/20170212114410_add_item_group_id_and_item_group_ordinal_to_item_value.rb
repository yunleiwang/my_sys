class AddItemGroupIdAndItemGroupOrdinalToItemValue < ActiveRecord::Migration
  def change
    add_column :item_values, :item_group_id, :integer
    add_column :item_values, :item_group_ordinal, :integer
  end
end
