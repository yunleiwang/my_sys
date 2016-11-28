class Menu < ActiveRecord::Base
  has_many :submenus, class_name: "Menu", foreign_key: "menu_id"
  belongs_to :menu, class_name: "Menu"
  has_many :menus_crf_infos
  has_many :crf_infos, :through => :menus_crf_infos


end
