class ItemFormMetaelement < ActiveRecord::Base
  belongs_to :crf_info
  belongs_to :item
  belongs_to :item_group
  has_many :children, class_name: "ItemFormMetaelement", foreign_key: "parent_id"
  belongs_to :parent, class_name: "ItemFormMetaelement"
  def items
    item_ids = (self.item_group.item_group_metaelements.collect{|item_group_metaelement| item_group_metaelement.item_id})
    Item.where('id in (?)', item_ids)
  end

  def parent_item
    parent_item_form_metaelement = self.parent
    if !parent_item_form_metaelement.nil?
      parent_item_form_metaelement.item
    else
      nil
    end
  end
end
