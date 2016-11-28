class ItemGroup < ActiveRecord::Base
  has_many :item_group_metaelements, :dependent => :destroy
  has_many :item_form_metaelements, :dependent => :destroy
  has_many :items, :through => :item_group_metaelements
end
