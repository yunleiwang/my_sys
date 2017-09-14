#coding:utf-8
require 'will_paginate'
require 'poi'
#require 'uuidtools'
class SearchConditionController < ApplicationController # 检索条件

	skip_before_filter :choose_patient
  ##精确检索
	#该类中用到了两个session变量
	#session[:sql]用于保存用户最近一次检索的条件
	#session[:num]用于标记条件的行数
  #single_sql 单行sql
  #select p.id from patient_infos p where sex=="女" intersect/union select i.patient_info_id from item_vlaues where

  def index
    #查找结果集一
    sql_statement = ""
    flag = false
    search_word = ''   #在检索页面上显示检索的条件
    #记录行数
    if session[:num].blank?
      session[:num]=0
    end
    (1..session[:num]).each do |num|
      if params["compare_select#{num}"] != nil
        crf_table_id = params["crf_id#{num}"]
        section_id = params["section_id#{num}"]
        item_id = params["item_id#{num}"]
        compare_select = params["compare_select#{num}"]  #判断> < >=
        textfield = params["textfield#{num}"] #判断值
        end_select =params["end_select#{num-1}"]#每行条件之间的关系(上一个检索条件的末尾条件)
        end_select2 =params["end_select#{num}"]#每行条件之间的关系(本行检索条件的末尾条件)
        single_sql = ""
        if crf_table_id=='0'#为患者基本信息，不是crf，需要在患者基本信息表中查找
          if !item_id.blank?
            item = SearchLib.find(item_id)
            search_word += get_search_word(num,item.field_name,compare_select,textfield,end_select2)
            single_sql = format_sql_v3('patients',item,compare_select,textfield)
          end
        else #为crf_table,在item_value中找
          if !item_id.blank?
            item = Item.find(item_id)
            search_word += get_search_word(num,item.left_item_text,compare_select,textfield,end_select2)
            single_sql = format_sql_v3('item_values',item,compare_select,textfield)
          end
        end

        if !single_sql.blank?
          #如果是第一行直接将sql赋值给sql_statement
          if end_select.blank?
            sql_statement += single_sql
          elsif end_select=="and"
            sql_statement = (sql_statement + " intersect " + single_sql)
          else
            sql_statement = (sql_statement+" union "+ single_sql)
          end
        end
        num += 1
      end
    end
    if !search_word.blank?
      if params[:in_result].blank?
        session[:search_word] = search_word
      else
        session[:search_word] = session[:search_word]+"并且"+search_word
      end
    end
    if sql_statement.blank?
      sql_statement = "select * from patients where id =0 "
    end

    #begin
      if params[:reset].blank?#params[:reset]在menu_libs表中的link字段中传过来，代表重新查找，清空session
        sql = "select * from patients where id=0"
        patient_info_ids = Patient.find_by_sql(sql_statement) #查看
        if !patient_info_ids.empty?
          sql = "select * from patients where id in(#{sql_statement})"
        end
        if session[:num]!=0&&!sql.blank? #代表有检索条件
          if params[:in_result].blank?
            session[:sql]=sql
          else
            session[:sql]= session[:sql] + " intersect " +sql
          end
        end
        if !session[:sql].blank?
          @patient_infos = Patient.paginate_by_sql(String.new(session[:sql]),:page => params[:page], :per_page => 20, :order => 'name')
        end

      else
        session[:sql]=nil
        session[:search_word]=nil
      end
      session[:num]=0
    # rescue
    #   redirect_to '/search_error.html'
    # end

  end


  def add_condition
    @s_libs = SearchLib.all.order('id asc')
    @crf_tables = CrfInfo.all.order('id asc')

  end
  def remove_condition
    respond_to do |format|
      format.js
    end
  end
  # 动态选择sections
  def add_section
    #num用于区分是第几行的select
    #如果params[:crf_id]=0,那么不是crfid，而是要查询patient_info信息
    @num = params[:num]
    if params[:crf_id].to_i==0
      @items = SearchLib.all
    else
      @crf_table = CrfInfo.find(params[:crf_id])
    end
    respond_to do |format|
      format.js
    end
  end
  #动态选择items
  def add_item
    @num = params[:num]
    if params[:crf_id].blank?
      @section = Section.find(params[:section_id])
      #@items = Item.all(:conditions=>{:section_label=>@section.section_label,:crf_table_id=>@section.crf_table_id})
      @items = @section.items
    else
      @flag = true
      @items = SearchLib.all
    end
    respond_to do |format|
      format.js
    end
  end

  def add_range
    respond_to do |format|
      format.js
    end
  end

=begin
	def index
    #查找结果集一
    sql_statement = ""
    flag = false
    search_word = ''   #在检索页面上显示检索的条件
    patient_info_ids=[]#存最终结果id
    patient_info_ids2=[]#存每行检索条件中查出的结果patient_info_id
    num = 1 #记录行数
    while params["compare_select#{num}"] != nil
      crf_table_id = params["crf_id#{num}"]
      section_id = params["section_id#{num}"]
      item_id = params["item_id#{num}"]
      compare_select = params["compare_select#{num}"]  #判断> < >=
      textfield = params["textfield#{num}"] #判断值
      end_select =params["end_select#{num-1}"]#每行条件之间的关系(上一个检索条件的末尾条件)
      end_select2 =params["end_select#{num}"]#每行条件之间的关系(本行检索条件的末尾条件)

      if crf_table_id=='0'#为患者基本信息，不是crf，需要在患者基本信息表中查找
        if !item_id.blank?
          item = SearchLib.find(item_id)
          search_word += get_search_word(num,item.field_name,compare_select,textfield,end_select2)
          sql_statement = format_sql_v3('patient_infos',item,compare_select,textfield)
        end
        #当前条件获得的patient_info_ids2 ，
        #如果句子和句子之间的关系是并（end_select= and）#如果句子和句子之间的关系是或者（end_select=or）
        if !sql_statement.blank?
          patient_info_ids2 = PatientInfo.find_by_sql(sql_statement).collect{|p|p.id}
        end
      else #为crf_table,在crf_table中找
        if !item_id.blank?
          item = Item.find(item_id)
          search_word += get_search_word(num,item.left_item_text,compare_select,textfield,end_select2)
          sql_statement = format_sql_v3('item_values',item,compare_select,textfield)
          if !sql_statement.blank?
            patient_info_ids2 = ItemValue.find_by_sql(sql_statement).collect{|i|i.patient_info_id}
          end
        end
      end
      #如果是第一行直接将第一行检索结果给patient_info_ids
      if end_select.blank?
        patient_info_ids = patient_info_ids2
      elsif end_select=="and"
        if patient_info_ids.length!=0
          #取交集
          patient_info_ids = patient_info_ids & patient_info_ids2
        end
      else
        patient_info_ids = (patient_info_ids | patient_info_ids2)
      end

      num += 1
    end
    session[:num] = 0 #精确检索时条件的计数器
    session[:range_num]=0
    sql = "SELECT * FROM patient_infos "
    #sql += "WHERE id in (" + session[:last_search_sql_statement] + ")"
    #patient_info_ids = []
    if !params[:search_info].blank?
      if !patient_info_ids.empty?
        str_patient_info_ids = patient_info_ids.join(',')
        sql += "WHERE id in (" + str_patient_info_ids + ")"
      else
          sql += "WHERE id = 0"
      end
    end
    @search_word = search_word
    @sql = sql
    begin
      @patient_infos = PatientInfo.paginate_by_sql(String.new(sql),:page => params[:page], :per_page => 20, :order => 'name')
    rescue
      redirect_to '/search_error.html'
    end

  end
=end


  #~~~~~~~~~~~~~~~对应的crf新精确检索获得每个检索条件的页面提示信息王云磊20140125~~~~~~~~~~~~~~
  ##
  # num   当前检索条件是第几个
  # item_name  当前检索条目的名称
  # compare_select 比较运算符
  # textfield   字段值
  # end_select  每行检索条件后边的关联符号
  ##
  def get_search_word(num,item_name,compare_select,textfield,end_select)
    search_word=""
    case compare_select
      when "like"
         compare_select= "包含"
      when"not like"
        compare_select= "不包含"
      when "is null"
        compare_select= "为空"
      when "is not null"
        compare_select= "不为空"
      else
    end

    case end_select
      when "and"
        end_select=" 并且 "
      when "or"
        end_select=" 或者 "
    end

    if num==session[:num]
      case compare_select
        when "is null","is not null"
          search_word = "#{item_name}#{compare_select}  "
        else
          search_word = "#{item_name}#{compare_select}#{textfield} "
      end

    else
      case compare_select
        when "is null","is not null"
          search_word = "#{item_name}#{compare_select}#{end_select} "
        else
          search_word = "#{item_name}#{compare_select}#{textfield} #{end_select} "
      end
    end
    return search_word
  end
  #~~~~~~~~~~~~~~~对应的crf新精确检索王云磊20140125~~~~~~~~~~~~~~
  ##
  # tableName     查询的数据表名称
  # item           查询的条目，patient_info表中的条目存在search_lib表中，crf的条目存在item表中
  # compare_symbol	比较运算符
  # columnValue		字段值
  # end_select    检索条件之间的关联关系（and ,or
  # patient_info_ids 当前患者的结果集）
  # results
  ##
  def format_sql_v3(tableName,item,compare_symbol,columnValue)
    if (is_null?(item.id) || is_null?(compare_symbol))
      return "";
    end

    if tableName=="patients"
     # result = SearchLib.find_by_field_name(columnName);
      result = SearchLib.find(item.id)
      correspond_field = result.correspond_field;  #对应字段
      correspond_field_value = result.correspond_field_value;  #对应字段值
      attached_field = result.attached_field;      #附加字段
      attached_value = result.attached_value;      #附加字段值
      ha = result.ha;                              #状态字段
      ha_value = result.ha_value;                  #状态字段值
      note = result.note;                          #字段类型
      host_table = result.host_table;              #对应表名称
      parent_table = result.parent_table;          #对应字段的父表名称
      parent_field = result.parent_field;          #对应字段的父表的字段
      parent_release = result.parent_release;      #与父表的关联条件
      sql = "select p.id from patients as p "
      case compare_symbol
        when "=",">",">=","<","<="
          if(note=="integer")
              if is_integer?(columnValue) && !is_null?(columnValue)
                sql += " where " +correspond_field +" "+ compare_symbol + " #{columnValue} "
              else
                return ""
              end
          elsif(note=="date"&& !is_null?(columnValue))
              if is_date?(columnValue) 
                sql += " where " +correspond_field +" "+ compare_symbol + " '#{columnValue}' "
              else
                return ""
              end
          elsif(note=="float" && !is_null?(columnValue))
             sql += " where cast(" + correspond_field + " as float)" + compare_symbol + " '#{columnValue}' "
          else
            sql += " where " +correspond_field +" " +compare_symbol + " '#{columnValue}' ";
          end

        when "like","not like"
          if (note == "date" ) #如果日期
            if (is_date?(columnValue)&& !is_null?(columnValue))
              if (compare_symbol == "like")
                sql += " where #{correspond_field} like '#{columnValue}'";
              else
                sql += " where #{correspond_field} <> '#{columnValue}'";
              end
            else
               return ""
            end

          else
            sql += " where " + correspond_field + " " + compare_symbol + "'%" + columnValue + "%'";
          end
        when "is null","is not null"
          sql += " where #{correspond_field} #{compare_symbol}";
        else
          #错误符号，忽略
      end
    else
      if item.item_data_type=="DATE"
        note="date"
      elsif ((item.item_data_type=="INT") ||(item.item_data_type=="int") )
        note="integer"
      elsif item.item_data_type=="REAL"
        note="float"
      end
      correspond_field = 'value'
      sql = "select distinct i.patient_id from item_values as i where item_id=#{item.id}"

      case compare_symbol
        when "=",">",">=","<","<="
          if(note=="integer")
            if (is_integer?(columnValue) && !is_null?(columnValue))
              sql += " and cast(#{correspond_field} as int) "  + compare_symbol + " #{columnValue.to_i} "
            else
              return ""
            end
          elsif(note=="date")
            if is_date?(columnValue) && !is_null?(columnValue)
              sql += " and cast(#{correspond_field} as date) "  + compare_symbol + " '#{columnValue.to_date}' and #{correspond_field} != ''"
            else
              return ""
            end
          elsif(note=="float" && !is_null?(columnValue))
            sql += " and cast(" + correspond_field + " as float)" + compare_symbol + " #{columnValue.to_f} and #{correspond_field} != ''"
          else
            sql += " and #{correspond_field} "  + compare_symbol + " '#{columnValue}' "
          end
        when "like","not like"
          if (note == "date") #如果日期
            if(is_date?(columnValue)) && !is_null?(columnValue)
              if (compare_symbol == "like")
                sql += " where cast(#{correspond_field} as date) like '#{columnValue}' and #{correspond_field} != '' ";
              else
                sql += " where cast(#{correspond_field} as date) <> '#{columnValue}' and #{correspond_field} != '' ";
              end
            else
              return ""
            end
          else
            sql += " and "+correspond_field + " " + compare_symbol + "'%" + columnValue + "%'";
          end
        when "is null","is not null"
          sql += " and #{correspond_field} #{compare_symbol}"
        else
          #错误符号，忽略
      end

    end


    return sql

  end


	#~~~~~~~~~~~~~~~~~~~~~~~20081219多表查询修改结束~~~~~~~~~~~~~~~~~~~~~~~~~~

	def get_results(field_name)
		@rely_on_condition = SearchLib.find(:first, :conditions => ["field_name=?", field_name]);
		parent_table = @rely_on_condition.parent_table;
		parent_field = @rely_on_condition.parent_field;
		host_table = @rely_on_condition.host_table;
		correspond_field = @rely_on_condition.correspond_field;

		sql = "";
		#    data_source_table = parent_table;
		#    data_source_field = parent_field;
		data_source_table = host_table;
		data_source_field = correspond_field;

		@results = nil;
		#    if (!is_null?(parent_table) && !is_null?(parent_field))
		sql = "select distinct #{data_source_field} as value from #{data_source_table} order by #{data_source_field}";
		@results = ActiveRecord::Base.connection.select_all(sql);
		#    end
		return @results;
	end

	def show_condition
		field_name = params[:field_name];
		@results = get_results(field_name);
		render :partial => "show_attached";
	end

	def show
    @patient_info = Patient.find(params[:id])
  end

	def export2excel3
      @crf_tables_menu_libs = CrfTablesMenuLib.all(:order=>'id asc')
      @crf_tables = CrfTable.all(:order=>'id asc')
      @patient_infos = PatientInfo.find_by_sql(params[:sql])

      filepath = File.join(Rails.root,'doc', "file.xls")#模板
      book = POI::Workbook.open(filepath) #打开模板
      #第一个模板为基本信息模板，后边为各个crf
      #~~~~~~~~~~~~~~~~~下边为导出基本信息的sheet~~~~~~~~~~~~~~~~~~~~~~~~~
      path = File.join(Rails.root,'doc', Time.now.strftime('%Y%m%d%H%M').to_i.to_s + ".xls")
      sheet = book.worksheets[0]
      rows = sheet.rows
      crr = []
      r_no = 0 #控制行数
      #第一行的内容为表头
      brr = []
      brr.push "患者ID"
      brr.push "姓名"
      brr.push "性别"
      brr.push "医保卡号"
      brr.push "住院号"
      brr.push "身份证号"
      brr.push "民族"
      brr.push "宗教信仰"
      brr.push "出生地"
      brr.push "何时来北京"
      brr.push "生日"
      crr[r_no] = brr
      r_no+=1
      #crr[0]=[id,name,"age","year"]
      #第二行之后的内容
      @patient_infos.each do |patient_info|
        brr = []
        brr.push patient_info.id
        brr.push patient_info.name
        brr.push patient_info.sex
        brr.push patient_info.medical_insurance
        brr.push patient_info.admission_number
        brr.push patient_info.IDCardNo
        brr.push patient_info.nation
        brr.push patient_info.religion
        brr.push patient_info.birth_place
        brr.push patient_info.time_to_beijing
        brr.push patient_info.birthday
        crr[r_no]=brr
        r_no+=1
      end
      r = 0
      crr.each do |am|
        c = 0
        am.each do |em|
          rows[r][c].value = em.to_s
          c+=1
        end
        r+=1
      end
      book.save_as(path)
      #~~~~~~~~~~~~~~~~~~基本信息导出结束~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      i =1 #控制worksheet的个数，每个crf用一个worksheet
      @crf_tables_menu_libs.each do |crf_tables_menu_lib|
        crf_table = crf_tables_menu_lib.crf_table
       # @crf_tables.each do |crf_table|
        sheet=nil
        begin
          sheet = book.worksheets[i]
        rescue
          sheet = book.create_sheet(crf_table.crf_name + (crf_tables_menu_lib.menu_lib.blank? ? "" :crf_tables_menu_lib.menu_lib.name_zh))
        end

        rows = sheet.rows
        crr = []
        r_no = 0 #控制行数
        #第一行的内容为表头
        brr = []
        items = Item.all(:conditions=>{:crf_table_id=>crf_table.id},:order=>'id asc')
        item_ids = Item.all(:conditions=>{:crf_table_id=>crf_table.id},:order=>'id asc').collect{|item| item.id }#对应crf_table的所有条目的id
        brr.push "患者ID"
        brr.push "患者姓名"
        items.each do|item|
          brr.push item.left_item_text
        end
        crr[r_no] = brr
        r_no+=1
        #crr[0]=[id,name,"age","year"]
        #第二行之后的内容
        @patient_infos.each do |patient_info|
          #查询出该患者对该crf检查的次数
         ordinals = ItemValue.all(:select=>'DISTINCT ordinal',:conditions=>{:patient_info_id=>patient_info.id,:crf_tables_menu_lib_id=>crf_tables_menu_lib.id},:order=>'ordinal').collect{|value|value.ordinal}
          #brr = []
          ###
          # # 以下码目的：确保所有患者的信息都要导出来，如果某患者没有进行过某个crf_table的评定，则也要显示出来，只显示患者id和患者姓名其他为空
          ###
          j = 0 #控制相同的patient_info_id 和patient_info_name输出一次
          if ordinals.length!=0 #确保没有检测该crf的患者同样输出患者空信息
            ordinals.each do |ordinal|
              brr1=[]
              if j==0
                brr1.push patient_info.id
                brr1.push patient_info.name
                j+=1
              else
                brr1.push ''
                brr1.push ''
              end
              item_ids.each do|item_id|
                item_value = ItemValue.all(:conditions=>{:item_id=>item_id,:patient_info_id=>patient_info.id,:crf_tables_menu_lib_id=>crf_tables_menu_lib.id,:ordinal=>ordinal.to_i}).first
                brr1.push (item_value.blank? ? nil :item_value.value)
              end
              crr[r_no]=brr1
              r_no+=1
            end
          else
            brr2=[]
            brr2.push patient_info.id
            brr2.push patient_info.name
            item_ids.each do|item_id|
              item_value = ItemValue.all(:conditions=>{:item_id=>item_id,:patient_info_id=>patient_info.id,:crf_tables_menu_lib_id=>crf_tables_menu_lib.id}).first
              brr2.push (item_value.blank? ? nil :item_value.value)
            end
            crr[r_no]=brr2
            r_no+=1
          end

        end

        r = 0
        crr.each do |am|
          c = 0
          am.each do |em|
            rows[r][c].value = em.to_s
            c+=1
          end
          r+=1
        end
        book.save_as(path)
        i+=1
      end
      File.open(path, "rb") {|f| send_data f.read, :filename => "patient_info.xls"}
      File.delete(path) if File.exist?(path)

  end



=begin
  def export2excel
    crf_tables_menu_libs = CrfTablesMenuLib.all(:order=>'id asc')
    crf_tables_menu_libs_ids = crf_tables_menu_libs.collect{|ctml|ctml.id}
    str_ctml_ids = crf_tables_menu_libs_ids.join(',')
    crf_tables = CrfTable.all
    patient_infos = PatientInfo.find_by_sql(params[:sql])
    patient_infos_ids = patient_infos.collect{|p|p.id}
    patient_infos_ids.uniq!
    str_patient_infos_ids = patient_infos_ids.join(",")
    sql = "select c.crf_name,s.section_label,i.item_name,i.description_label,i.id as item_id,i.left_item_text,i.crf_table_id from crf_tables as c"
    sql +=" join items as i on i.crf_table_id=c.id join sections as s on s.section_label=i.section_label "
    sql += " order by s.id,i.id"
    crf_infos = Item.find_by_sql(sql)
    hospital_sql = "select * from hospital_records where patient_info_id in (#{str_patient_infos_ids.blank? ? 0 : str_patient_infos_ids}) "
    hospital_records = HospitalRecord.find_by_sql(hospital_sql)
    value_sql = "select iv.value,iv.patient_info_id,iv.ordinal,iv.crf_tables_menu_lib_id,iv.item_id,iv.hospital_record_id,i.id,s.id,s.section_label from item_values "
    value_sql +=" as iv left join items as i on i.id = iv.item_id left join sections as s on s.section_label = i.section_label left join crf_tables as c "
    value_sql +=" on c.id=i.crf_table_id where crf_tables_menu_lib_id in (#{str_ctml_ids}) and patient_info_id in (#{str_patient_infos_ids}) order by s.id,i.id"
    item_values = ItemValue.find_by_sql(value_sql)
    #模板
    filepath = File.join(Rails.root,'doc', "file.xls")
    book = POI::Workbook.open(filepath) #打开模板
    #第一个模板为基本信息模板，后边为各个crf
    #~~~~~~~~~~~~~~~~~下边为导出基本信息的sheet~~~~~~~~~~~~~~~~~~~~~~~~~
    path = File.join(Rails.root,'doc', Time.now.strftime('%Y%m%d%H%M').to_i.to_s + ".xls")
    sheet = book.worksheets[0]
    rows = sheet.rows
    crr = []
    r_no = 0 #控制行数
    #第一行的内容为表头
    brr = []
    brr.push "姓名"
    brr.push "性别"
    brr.push "出生日期"
    brr.push "患者ID"
    brr.push "住院号" 
	  brr.push "电话"
	  brr.push "邮箱"
	  brr.push "籍贯"
	  brr.push ""
	  brr.push "我院首诊日期"
	  brr.push "通信地址"
	  brr.push "邮政编码"
	  brr.push "末次经治医生"
    crr[r_no] = brr
    r_no+=1
    #第二行之后的内容
    patient_infos.each do |patient_info|
      brr = []
      brr.push patient_info.name
      brr.push patient_info.sex
      brr.push patient_info.birthday
      brr.push patient_info.patient_id
      brr.push patient_info.hosp_id
      brr.push patient_info.phone
	    brr.push patient_info.email
	    brr.push patient_info.native_place
	    brr.push patient_info.first_insp
	    brr.push patient_info.marital_state
	    brr.push patient_info.address
	    brr.push patient_info.zip_code
	    brr.push patient_info.last_doctor
      crr[r_no]=brr
      r_no+=1
    end
    r = 0
    crr.each do |am|
      c = 0
      am.each do |em|
        rows[r][c].value = em.to_s
        c+=1
      end
      r+=1
    end
    #book.save_as(path)
    #~~~~~~~~~~~~~~~~~~基本信息导出结束~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #控制worksheet的个数，每个crf用一个worksheet
    i = 1
    crf_tables_menu_libs.each do |crf_tables_menu_lib|
      crf_table = crf_tables.select{|c|c.id==crf_tables_menu_lib.crf_table_id}.first
      sheet=nil

      begin
        sheet = book.worksheets[i]
      rescue
        sheet = book.create_sheet(crf_table.crf_name)
      end
      if crf_table.crf_name == "糖尿病相关症状"
        next
      end
      rows = sheet.rows
      crr = []
      r_no = 0 #控制行数
      #第一行的内容为表头
      brr = []
      crf_items = crf_infos.select{|c|c.crf_table_id == crf_table.id}   #此处是item
      crf_items.uniq!
      item_ids = crf_items.collect{|ci|ci.item_id}
      brr.push "姓名"
      brr.push "性别"
      brr.push "出生日期"
      brr.push "患者ID"
      brr.push "住院号"
      crf_items.each do|item|
        brr.push item.left_item_text
      end
      crr[r_no] = brr
      r_no+=1
      patient_infos.each do |patient_info|
        #查询出该患者对该crf检查的次数
        hos_records = hospital_records.select{|hr|hr.patient_info_id==patient_info.id}

        hos_records.each do |hos_record|
          ordinals = item_values.select{|ci|ci.patient_info_id==patient_info.id && ci.hospital_record_id== hos_record.id && ci.crf_tables_menu_lib_id==crf_tables_menu_lib.id}.collect{|ci|ci.ordinal}
          ordinals.uniq!
          # 以下代码目的：确保所有患者的信息都要导出来，如果某患者没有进行过某个crf_table的评定，则也要显示出来，只显示患者id和患者姓名其他为空
          #控制相同的patient_info_id 和patient_info_name输出一次
          j = 0
          #确保没有检测该crf的患者同样输出患者空信息
          if ordinals.length!=0
            ordinals.each do |ordinal|
              brr1=[]
              if j==0
                brr1.push patient_info.name
                brr1.push patient_info.sex
                brr1.push patient_info.birthday
                brr1.push patient_info.patient_id
                brr1.push patient_info.hosp_id
                j+=1
              else
                brr1.push ''
                brr1.push ''
                brr1.push ''
                brr1.push ''
                brr1.push ''
              end

              values = item_values.select{|iv|item_ids.include?(iv.item_id)&&iv.patient_info_id==patient_info.id&& iv.hospital_record_id== hos_record.id &&iv.crf_tables_menu_lib_id==crf_tables_menu_lib.id}
              values.each do |item_value|
                brr1.push (item_value.blank? ? nil : item_value.value)
              end
              crr[r_no]=brr1
              r_no+=1
            end
          else
            brr2=[]
            brr2.push patient_info.name
            brr2.push patient_info.sex
            brr2.push patient_info.birthday
            brr2.push patient_info.patient_id
            brr2.push patient_info.hosp_id
            values = item_values.select{|iv|item_ids.include?(iv.item_id)&&iv.patient_info_id==patient_info.id&& iv.hospital_record_id== hos_record.id &&iv.crf_tables_menu_lib_id==crf_tables_menu_lib.id}
            values.each do|item_value|
              brr2.push (item_value.blank? ? nil :item_value.value)
            end

            crr[r_no]=brr2
            r_no+=1
          end

          end
      end
      r = 0
      crr.each do |am|
        c = 0
        am.each do |em|
          rows[r][c].value = em.to_s
          c+=1
        end
        r+=1
      end
      i+=1
    end
    book.save_as(path)
    File.open(path, "rb") {|f| send_data f.read, :filename => "patient_info.xls"}
    File.delete(path) if File.exist?(path)

  end
=end

    def export2excel
      crf_tables_menu_libs = CrfTablesMenuLib.all(:order=>'id asc')
      crf_tables_menu_libs_ids = crf_tables_menu_libs.collect{|ctml|ctml.id}
      str_ctml_ids = crf_tables_menu_libs_ids.join(',')
      crf_tables = CrfTable.all
      patient_infos = PatientInfo.find_by_sql(params[:sql])
      patient_infos_ids = patient_infos.collect{|p|p.id}
      patient_infos_ids.uniq!
      str_patient_infos_ids = patient_infos_ids.join(",")
      sql = "select c.crf_name,s.section_label,i.item_name,i.description_label,i.id as item_id,i.left_item_text,i.crf_table_id from crf_tables as c"
      sql +=" join items as i on i.crf_table_id=c.id join sections as s on s.section_label=i.section_label "
      sql += " order by s.id,i.id"
      crf_infos = Item.find_by_sql(sql)
      hospital_sql = "select * from hospital_records where patient_info_id in (#{str_patient_infos_ids.blank? ? 0 : str_patient_infos_ids}) "
      hospital_records = HospitalRecord.find_by_sql(hospital_sql)
      value_sql = "select iv.value,iv.patient_info_id,iv.ordinal,iv.crf_tables_menu_lib_id,iv.item_id,iv.hospital_record_id,i.id,s.id,s.section_label from item_values "
      value_sql +=" as iv left join items as i on i.id = iv.item_id left join sections as s on s.section_label = i.section_label left join crf_tables as c "
      value_sql +=" on c.id=i.crf_table_id where crf_tables_menu_lib_id in (#{str_ctml_ids}) and patient_info_id in (#{str_patient_infos_ids}) order by s.id,i.id"
      item_values = ItemValue.find_by_sql(value_sql)
      #模板
      filepath = File.join(Rails.root,'doc', "file.xls")
      book = POI::Workbook.open(filepath) #打开模板
      #第一个模板为基本信息模板，后边为各个crf
      #~~~~~~~~~~~~~~~~~下边为导出基本信息的sheet~~~~~~~~~~~~~~~~~~~~~~~~~
      path = File.join(Rails.root,'doc', Time.now.strftime('%Y%m%d%H%M').to_i.to_s + ".xls")
      sheet = book.worksheets[0]
      rows = sheet.rows
      crr = []
      r_no = 0 #控制行数
      #第一行的内容为表头
      brr = []
      brr.push "姓名"
      brr.push "性别"
      brr.push "出生日期"
      brr.push "患者ID"
      brr.push "住院号"
      brr.push "电话"
      brr.push "邮箱"
      brr.push "籍贯"
      brr.push ""
      brr.push "我院首诊日期"
      brr.push "通信地址"
      brr.push "邮政编码"
      brr.push "末次经治医生"
      crr[r_no] = brr
      r_no+=1
      #第二行之后的内容
      patient_infos.each do |patient_info|
        brr = []
        brr.push patient_info.name
        brr.push patient_info.sex
        brr.push patient_info.birthday
        brr.push patient_info.patient_id
        brr.push patient_info.hosp_id
        brr.push patient_info.phone
        brr.push patient_info.email
        brr.push patient_info.native_place
        brr.push patient_info.first_insp
        brr.push patient_info.marital_state
        brr.push patient_info.address
        brr.push patient_info.zip_code
        brr.push patient_info.last_doctor
        crr[r_no]=brr
        r_no+=1
      end
      r = 0
      crr.each do |am|
        c = 0
        am.each do |em|
          rows[r][c].value = em.to_s
          c+=1
        end
        r+=1
      end
      #book.save_as(path)
      #~~~~~~~~~~~~~~~~~~基本信息导出结束~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      #控制worksheet的个数，每个crf用一个worksheet
      i = 1
      crf_tables_menu_libs.each do |crf_tables_menu_lib|
        crf_table = crf_tables.select{|c|c.id==crf_tables_menu_lib.crf_table_id}.first
        sheet=nil

        begin
          sheet = book.worksheets[i]
        rescue
          sheet = book.create_sheet(crf_table.crf_name)
        end
        if crf_table.crf_name == "糖尿病相关症状"
          next
        end
        rows = sheet.rows
        crr = []
        r_no = 0 #控制行数
                 #第一行的内容为表头
        brr = []
        crf_items = crf_infos.select{|c|c.crf_table_id == crf_table.id}   #此处是item
        crf_items.uniq!
        item_ids = crf_items.collect{|ci|ci.item_id}
        brr.push "姓名"
        brr.push "性别"
        brr.push "出生日期"
        brr.push "患者ID"
        brr.push "住院号"
        brr.push "住院日期"
        crf_items.each do|item|
          brr.push item.left_item_text
        end
        crr[r_no] = brr
        r_no+=1
        patient_infos.each do |patient_info|
          #查询出该患者对该crf检查的次数
          brr1=[]
          brr1.push patient_info.name
          brr1.push patient_info.sex
          brr1.push patient_info.birthday
          brr1.push patient_info.patient_id
          hos_records = hospital_records.select{|hr|hr.patient_info_id==patient_info.id}
          if hos_records.empty?
             brr1.push ""
             brr1.push ""
             crf_items.each do|item|
               brr1.push ""
             end
             crr[r_no]=brr1
             r_no+=1
          else
            h_count = 0
            hos_records.each do |hos_record|
              ordinals = item_values.select{|ci|ci.patient_info_id==patient_info.id && ci.hospital_record_id== hos_record.id && ci.crf_tables_menu_lib_id==crf_tables_menu_lib.id}.collect{|ci|ci.ordinal}
              ordinals.uniq!
              if h_count==0
                 brr1.push hos_record.record_id
                 brr1.push hos_record.enter_date
                 h_count+=1
                 o_count=0
                 if ordinals.length!=0
                   ordinals.each do |ordinal|
                     values = item_values.select{|iv|item_ids.include?(iv.item_id)&&iv.patient_info_id==patient_info.id&& iv.hospital_record_id== hos_record.id &&iv.crf_tables_menu_lib_id==crf_tables_menu_lib.id&&iv.ordinal==ordinal}
                     if o_count==0
                       values.each do |item_value|
                         brr1.push (item_value.blank? ? nil : item_value.value)
                       end
                       crr[r_no]=brr1
                       r_no+=1
                       o_count+=1
                     else
                       brr2=[]
                       brr2.push ''
                       brr2.push ''
                       brr2.push ''
                       brr2.push ''
                       brr2.push ''
                       brr2.push ''
                       values.each do |item_value|
                         brr2.push (item_value.blank? ? nil : item_value.value)
                       end
                       crr[r_no]=brr2
                       r_no+=1
                     end
                   end
                 else
                   crf_items.each do|item|
                     brr1.push ""
                   end
                   crr[r_no]=brr1
                   r_no+=1
                 end
              else
                 brr2=[]
                 brr2.push ""
                 brr2.push ""
                 brr2.push ""
                 brr2.push ""
                 brr2.push hos_record.record_id
                 brr2.push hos_record.enter_date

                 o_count=0
                 if ordinals.length!=0
                   ordinals.each do |ordinal|
                     values = item_values.select{|iv|item_ids.include?(iv.item_id)&&iv.patient_info_id==patient_info.id&& iv.hospital_record_id== hos_record.id &&iv.crf_tables_menu_lib_id==crf_tables_menu_lib.id&&iv.ordinal==ordinal}
                     if o_count==0
                       values.each do |item_value|
                         brr2.push (item_value.blank? ? nil : item_value.value)
                       end
                       crr[r_no]=brr2
                       r_no+=1
                       o_count+=1
                     else
                       brr3=[]
                       brr3.push ''
                       brr3.push ''
                       brr3.push ''
                       brr3.push ''
                       brr3.push ''
                       brr3.push ''
                       values.each do |item_value|
                         brr3.push (item_value.blank? ? nil : item_value.value)
                       end
                       crr[r_no]=brr3
                       r_no+=1
                     end
                   end
                 else
                   crf_items.each do|item|
                     brr2.push ""
                   end
                   crr[r_no]=brr2
                   r_no+=1
                 end
              end


            end

          end

        end
        r = 0
        crr.each do |am|
          c = 0
          am.each do |em|
            rows[r][c].value = em.to_s
            c+=1
          end
          r+=1
        end
        i+=1
      end
      book.save_as(path)
      File.open(path, "rb") {|f| send_data f.read, :filename => "patient_info.xls"}
      File.delete(path) if File.exist?(path)

    end


  private



  #~~~~~~~~~~~~20081219多表查询修改开始~~~~~~~~~~~~~~~
  #修改时间：20081219
  #高晓晨
  #原因：实现多表查询
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  ##
  # 拼写多表查询的SQL语句
  # columnName 		字段名称
  # compare_symbol	比较运算符
  # columnValue		字段值
  # results
  ##
  def format_sql_v2(columnName,compare_symbol,columnValue, results)

    if (is_null?(columnName) || is_null?(compare_symbol))
      return "";
    end

    result = SearchLib.find_by_field_name(columnName);
    correspond_field = result.correspond_field;  #对应字段
    correspond_field_value = result.correspond_field_value;  #对应字段值
    attached_field = result.attached_field;      #附加字段
    attached_value = result.attached_value;      #附加字段值
    ha = result.ha;                              #状态字段
    ha_value = result.ha_value;                  #状态字段值
    note = result.note;                          #字段类型
    host_table = result.host_table;              #对应表名称
    parent_table = result.parent_table;          #对应字段的父表名称
    parent_field = result.parent_field;          #对应字段的父表的字段
    parent_release = result.parent_release;      #与父表的关联条件

                                                 #如果表中对应字段值不为空，则使用表中的值
                                                 #否则对columnValue进行有效性判断
    array = []
    if (!is_null?(correspond_field_value))
      columnValue = correspond_field_value;
    else
      # 如果是勾选的（在lib_publics表中读值） 到 lib_public 中读取value值后 在查询 ， 否者直接用页面传递上来的值到本表中查询
      if result.is_lib_public
        ## 兼容lib_publics 检索
        ca = "#{host_table[0..4].eql?("view_") ? host_table.split('_', 2)[1].classify :
            host_table.classify}[#{correspond_field}]"

        libs = LibPublic.all(:conditions => {:ca => "diagnose[]"})
        libs.each do |o|
          flag = false
          if compare_symbol.include?('like')
            flag = o.cn.include?(columnValue)
          elsif %w{= >= > <= <}.include?(compare_symbol)
            flag = o.cn.eql?(columnValue)
          end
          array << o.value if flag
        end unless libs.blank? # 如果libs不为空，则说明此字段的值取自字典表
        if array.length == 1
          columnValue = array[0]
        elsif !array.blank?
          columnValue = array
        end
      end
      #如果用户检索的条件是为空、不为空，则可以不输入检索的值
      if (compare_symbol!="is null" && compare_symbol!="is not null")
        #如果附加字段的值为空，文本框的值也为空，则返回""
        if (is_null?(columnValue) && (results == nil || results.empty?))
          return "";
        end
        #是否合法日期值
        if (note == "date" && !is_date?(columnValue))
          return "";
        end
        #是否合法整型值
        if (note == "integer" && !is_integer?(columnValue) && libs.blank?)
          return "";
        end
      end
    end

    attached_sql = "";
    #获取字段所需要的附加字段及附加字段值
    if (!is_null?(attached_field) && !is_null?(attached_value) && (results == nil || results.empty?))
      attached_sql = " and #{attached_field} = '#{attached_value}'"
    end
    #获取字段的状态值
    if (!is_null?(ha) && !is_null?(ha_value) && (results == nil || results.empty?))
      attached_sql += " and #{ha} = '#{ha_value}'"
    end

    data_source_table = parent_table;
    data_source_field = parent_field;
    if (is_null?(parent_table) || is_null?(parent_field))
      data_source_table = host_table;
      data_source_field = correspond_field;
    end
    data_source_sql = "";
    data_source_count = 0;
    while (data_source_count < results.length)
      data_source_sql += " #{data_source_table}.#{data_source_field} = '#{results[data_source_count]}' ";
      if (data_source_count + 1 != results.length)
        data_source_sql += " or ";
      end
      data_source_count += 1;
    end
    if (data_source_sql != "")
      data_source_sql = "(#{data_source_sql})";
    end

    if (host_table == "patient_infos")
      sql = "(select #{host_table}.id from " + host_table;
    else
      sql = "(select #{host_table}.patient_info_id from " + host_table;
    end
    if (!is_null?(parent_table))
      sql += " join #{parent_table} on (#{parent_table}.id = #{host_table}.#{parent_release}) ";
    end

    #数字型和字符串型的区分通过表中的note字段来进行区分
    flag_case = false
    case compare_symbol
      when "=",">",">=","<","<="
        if(note=="integer" && (results == nil || results.empty?))
          sql += " where " + correspond_field + compare_symbol + columnValue;
          flag_case = true;
        else if(note == "float" && (results == nil || results.empty?))
               flag_case = true;
               sql += " where cast(" + correspond_field + " as float) " + compare_symbol+columnValue;
             else if(results == nil || results.empty?)
                    flag_case = true;
                    sql += " where " + correspond_field + compare_symbol+"'"+columnValue+"'";
                  end end
        end
      when "like","not like"
        if (note == "date" && (results == nil || results.empty?)) #如果日期
          if (compare_symbol == "like")
            flag_case = true;
            sql += " where #{correspond_field} = '#{columnValue}'";
          else
            flag_case = true;
            sql += " where #{correspond_field} <> '#{columnValue}'";
          end
        else
          if (results == nil || results.empty?)
            flag_case = true;
            if columnValue.class == Array
              sql += " where "
              str = []
              columnValue.each do |cv|
                str << "#{correspond_field} #{compare_symbol} '%#{cv}%'";
              end
              sql += str.join(" or ")
            else
              sql += " where " + correspond_field + " " + compare_symbol + "'%" + columnValue + "%'";
            end
          end
        end
      when "is null","is not null"
        if (is_null?(attached_field) && !is_null?(attached_value))
          sql += " where #{correspond_field} = '#{columnValue}'";
        else
          sql += " where #{correspond_field} #{compare_symbol}";
        end
        flag_case = true;
      else
        #错误符号，忽略
    end

    if (!is_null?(data_source_sql))
      if (!flag_case)
        data_source_sql = "where #{data_source_sql} ";
      else
        data_source_sql = "and #{data_source_sql} ";
      end
    end
    sql += "#{attached_sql} #{data_source_sql})";
    return sql;
  end

  ##
  #本方法对null的定义：
  #如果值为nil或者""则此值为空。
  #为空返回true
  ##
  def is_null?(value)
    if (value == nil || value == "")
      return true;
    end
    return false;
  end

  #判断是否日期类型
  def is_date?(value)
    begin
      value.to_date
      return true
    rescue
      return false
    end
  end
  #判断是否整型
  def is_integer?(value)
    if (value =~ /^[0-9]+$/)
      return true
    end
    return false
  end

  def if_nil?(obj)
    return ' ' if obj.blank?
    return obj.to_s
  end




end

