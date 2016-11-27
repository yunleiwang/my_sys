class Section < ActiveRecord::Base
  belongs_to :crf_info
  has_many :item_form_metaelements, :dependent => :destroy
end
