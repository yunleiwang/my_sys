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
    crf_infos_size = menu.crf_infos.count
    if !sub_menus.empty?||crf_infos_size>0
      a_class= "dropdown-toggle"
    end
    a_class
  end

  def breadcrumbs(*arg)
    len = arg.length
    content_tag(:div, :class => "breadcrumbs", :id=>"breadcrumbs") do
      content_tag(:ul, :class => "breadcrumb") do
        arg.each_with_index do |member, index|
          if index==len-1
            concat(content_tag(:li, :class=>"active") do
              member
            end)
          else
            concat(content_tag(:li) do
              content_tag :a,member
            end)
          end
        end
      end
    end
  end
end
