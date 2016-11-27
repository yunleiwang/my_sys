module ApplicationHelper
  def nav_li_class(index,menu_id)
    li_class= ""
     if index==0 && params[:menu_id].nil?
       li_class= "active"
     end
     li_class
  end

  def nav_a_class(menu)
    a_class= ""
    sub_menus = menu.submenus
    if !sub_menus.empty?
      a_class= "dropdown-toggle"
    end
    a_class
  end
end
