class ItemValue < ActiveRecord::Base
  belongs_to :item_value_order
  belongs_to :patient
  belongs_to :patient_visit
  belongs_to :item
  belongs_to :menus_crf_info
  belongs_to :item_group
end
