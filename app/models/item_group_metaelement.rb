class ItemGroupMetaelement < ActiveRecord::Base
  belongs_to :item_group
  belongs_to :item
end
