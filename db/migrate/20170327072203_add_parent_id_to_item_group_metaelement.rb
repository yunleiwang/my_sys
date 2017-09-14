class AddParentIdToItemGroupMetaelement < ActiveRecord::Migration
  def change
    add_column :item_group_metaelements, :parent_id, :integer
  end
end
