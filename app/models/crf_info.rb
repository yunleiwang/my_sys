require 'poi'
class CrfInfo < ActiveRecord::Base
  has_many :sections, :dependent => :destroy
  has_many :item_form_metaelements, :dependent => :destroy

  #导入CRF表
  def import_crf
    crf_info=nil
    filepath = File.join(Rails.root,'4.xls')

    CrfInfo.transaction do
      if File.exist?(filepath)
        book = POI::Workbook.open(filepath)
        # 导入crf_info信息
        sheet = book.worksheets[0]
        rows = sheet.rows
        no = 0
        rows.each do |row|
          if no>0
            crf_info = CrfInfo.new
            crf_info.name = row[0].to_s
            crf_info.description= row[2].to_s
            crf_info.save
          end
          no+=1
        end

        # 导入section信息
        sheet = nil
        begin
          sheet = book.worksheets[1]
        rescue
          return
        end
        rows = sheet.rows
        no = 0
        rows.each do |row|
          if no>0
            section = Section.new
            section.crf_info_id=crf_info.id
            section.name= row[0].to_s
            section.title = row[1].to_s
            section.subtitle = row[2].to_s
            section.save
          end
          no+=1
        end

        # 导入group信息
        sheet = nil
        begin
          sheet = book.worksheets[2]
        rescue
          return
        end
        rows = sheet.rows
        no = 0
        rows.each do |row|
          if no>0
            group = ItemGroup.new
            group.name= row[0].to_s
            group.description= row[1].to_s
            group.save

          end
          no+=1
        end


        # 导入item
        sheet = nil
        begin
          sheet = book.worksheets[3]
        rescue
          return
        end
        rows = sheet.rows
        no = 0
        rows.each do |row|
          if no>0
            item = Item.new
            item.name= row[0].to_s
            item.description=  row[1].to_s
            item.left_item_text= row[2].to_s
            item.units=  row[3].to_s
            item.right_item_text= row[4].to_s
            #item.section_label= row[5].to_s
            #item.group_label= row[6].to_s
            item.header= row[7].to_s
            #item.subheader= row[8].to_s
            #item.parent_item = row[9].to_s
            #item.column_number= row[10].to_s
            #item.page_number= row[11].to_s
            #item.question_number= row[12].to_s
            item.response_type = row[13].to_s
            #item.response_label = row[14].to_s
            item.options_text = row[15].to_s
            item.options_value= row[16].to_s
            #item.respinse_layout = row[17].to_s
            item.default_value= row[18].to_s
            item.item_data_type= row[19].to_s
            #item.width_decimal= row[20].to_s
            item.regexp= row[21].to_s
            item.regexp_error_msg= row[22].to_s
            #item.phi=row[23].to_s
            #item.required = row[24].to_s
            #item.item_category = row[25].to_s
            #item.has_rule = row[26].to_s
            #item.only_result_show = row[26].to_s
            #item.use_foreign_table = row[27].to_s
            item.save


            # 导入item_form_metaelement
            group_label = row[6].to_s

            item_form_metaelement = ItemFormMetaelement.new
            item_form_metaelement.crf_info_id=crf_info.id
            section_label= row[5].to_s
            section= Section.where("title=? and crf_info_id=?",section_label,crf_info.id).first
            item_form_metaelement.section_id=section.id
            item_form_metaelement.header= row[7].to_s
            item_form_metaelement.subheader= row[8].to_s
            # ######查询item_form_metaelement的parent_id#####
            parent_name = row[9].to_s
            parent_item = nil
            if !parent_name.nil?
              parent_item = Item.find_by_name(parent_item)
              if !parent_item.nil?
                parent_item_form_metaelement = ItemFormMetaelement.where('item_id=? and section_id=?',parent_item.id,section.id).first
                item_form_metaelement.parent_id= parent_item_form_metaelement.id
              end
            end
            # #######查询item_form_metaelement的parent_id#####
            item_form_metaelement.ordinal= row[10].to_s
            required= row[24].to_s
            if required=="0"
              item_form_metaelement.required= false
            else
              item_form_metaelement.required= true
            end
            phi= row[23].to_s
            if phi=="0"
              item_form_metaelement.show_item= false
            else
              item_form_metaelement.show_item= true
            end
            item_form_metaelement.trigger= row[14].to_s #response_label
            item_form_metaelement.options_index= row[23].to_s #respinse_layout

            # 导入item_group_metaelement
            #group_label = row[6].to_s
            # group_label 不为空
            if !group_label.blank?
              item_group = ItemGroup.find_by_name(group_label)
              if !item_group.blank?
                # item_form_metaelements中只需要存一个item_group_id，不需要重复存
                ifm = ItemFormMetaelement.find_by_item_group_id(item_group.id)
                if ifm.nil?
                  item_form_metaelement.item_group_id=item_group.id
                  item_form_metaelement.save
                else
                  item_group_metaelement = ItemGroupMetaelement.new
                  item_group_metaelement.item_group_id=item_group.id
                  item_group_metaelement.header=row[7].to_s
                  item_group_metaelement.subheader=row[8].to_s
                  item_group_metaelement.item_id=item.id
                  item_group_metaelement.show_group=phi
                end

                if !parent_item.nil?
                  parent_item_group_metaelement = ItemGroupMetaelement.where('item_id=? and section_id=?',parent_item.id,section.id).first
                  item_group_metaelement.parent_id= parent_item_group_metaelement.id
                end
                item_group_metaelement.save
              end
            else
              item_form_metaelement.item_id= item.id
              item_form_metaelement.save
            end


          end
          no+=1
        end

      end


    end
  end

end
