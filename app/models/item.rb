class Item < ActiveRecord::Base
  has_many :item_form_metaelements, :dependent => :destroy
  has_many :item_group_metaelements, :dependent => :destroy
  has_many :item_groups, :through => :item_group_metaelements
  #返回
  def datas
    datas = []
    texts = self.options_text
    values = self.options_value
    final_texts = texts.split(',')
    final_values = values.split(',')
    if final_texts.length==final_values.length
      final_texts.each_with_index do|text ,index|
        hash = Hash.new
        hash["text"] = text
        hash["index"] = index
        hash["value"] = final_values[index]
        datas<<hash
      end
    end
    datas
  end

end
