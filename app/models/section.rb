class Section < ActiveRecord::Base
  belongs_to :crf_info
  has_many :item_form_metaelements, :dependent => :destroy

  def items
    items_ids = self.item_form_metaelements.collect{|ifm|ifm.item_id}
    items = Item.where('id in (?)', items_ids)
  end
end
