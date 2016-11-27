class Menu < ActiveRecord::Base
  has_many :submenus, class_name: "Menu", foreign_key: "menu_id"
  belongs_to :menu, class_name: "Menu"


end
