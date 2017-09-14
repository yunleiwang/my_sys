class ItemValueOrder < ActiveRecord::Base
  has_many :item_values, :dependent => :destroy
  belongs_to :crf_info
  belongs_to :menus_crf_info
  belongs_to :patient
  belongs_to :patient_visit
end
