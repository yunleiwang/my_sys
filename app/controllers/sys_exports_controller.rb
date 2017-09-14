#coding: utf-8
require 'poi'
class SysExportsController < ApplicationController
  # GET /sys_exports
  # GET /sys_exports.json

  def index
    @sys_exports = SysExport.all
    #@crf_tables_menu_libs = CrfTablesMenuLib.includes(:crf_table,:menu_lib).all
    @search_libs = SearchLib.order("id asc").all
    @crf_tables = CrfInfo.order("id desc").all
    respond_to do |format|
      format.html {}# application.html.erb.erb
      format.json { render json: @sys_exports }
    end
  end

  # GET /sys_exports/1
  # GET /sys_exports/1.json
  def show
    render :layout => 'moban_show'

  end

  # GET /sys_exports/new
  # GET /sys_exports/new.json
  def new
    @sys_export = SysExport.new
    render :layout => 'moban_edit'
  end

  # GET /sys_exports/1/edit
  def edit
    @sys_export = SysExport.find(params[:id])
    render :layout => 'moban_edit'
  end

  # POST /sys_exports
  # POST /sys_exports.json
  def create
    params.permit!
    SysExport.transaction do
      SysExport.delete_all
      if !params["patient_info"].nil?
        params["patient_info"].each do |key,value|
          my_value = value.split("|")
          field_zh_name = my_value[1]
          field_en_name = my_value[0]

          SysExport.create(
              :field_en_name=>field_en_name,
              :field_zh_name=>field_zh_name,
              :table_name =>"patient_infos"
          )
        end
      end

      CrfInfo.all.each do |crf_table|
        if !params["crf_#{crf_table.id}_name"].nil?
          params["crf_#{crf_table.id}_name"].values.each do |value|
            my_value = value.split("|")
            field_zh_name = my_value[1]
            field_en_name = my_value[0]
            item_id = my_value[2].to_i
            SysExport.create(
                :field_en_name=>field_en_name,
                :field_zh_name=>field_zh_name,
                :table_name =>"items",
                :crf_table_id=>crf_table.id,
                :item_id=>item_id
            )
          end
        end
      end
    end
    redirect_to :action=>'index',:id => 1

  end

  # PUT /sys_exports/1
  # PUT /sys_exports/1.json
  def update
    @sys_export = SysExport.find(params[:id])

    respond_to do |format|
      if @sys_export.update_attributes(params[:sys_export])
        format.html { redirect_to @sys_export, notice: 'Sys export was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sys_export.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sys_exports/1
  # DELETE /sys_exports/1.json
  def destroy
    @sys_export = SysExport.find(params[:id])
    @sys_export.destroy

    respond_to do |format|
      format.html { redirect_to sys_exports_url }
      format.json { head :no_content }
    end
  end

  #项目中的任何一个表都可以调取这个方法，这个方法是用来将项目中的表导出到excel中
  #如果在导出设置中勾选了需要导出的项目，则会按照指定的字段导出，若没有，则导出表中的全部字段。
  def export_table
=begin
    table_name = params[:table_name]
    table = table_name.singularize
    @temp = eval(table.classify).find_by_sql(session[:table_sql])

    #@temp = eval(table_name)
    @sys_exports = SysExport.find_all_by_table_name(table_name)
    filepath = File.join(Rails.root,'tmp/cache', "file.xls")
    path = File.join(Rails.root,'tmp/cache', Time.now.strftime('%Y%m%d%H%M').to_i.to_s + ".xls")
    book = POI::Workbook.open(filepath)
    sheet = book.worksheets[0]
    rows = sheet.rows
    #生成表头
    arr = []
    if @sys_exports.blank?  #导出设置中没有指定要导出的字段
      @sys_fields = SysField.find_all_by_en_table_name(table_name)
      if !@sys_fields.blank?
        @sys_fields.each do |sf|
          arr << (sf.zh_field_name || sf.en_field_name)
        end
        if !@temp.blank?
          crr = []
          r_no = 1 #控制行数
          crr[0] = arr
          @temp.each do |pid|
            brr = []
            @sys_fields.each do |sf|
              brr.push pid.send(sf.en_field_name)
            end
            crr[r_no] = brr
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
          File.open(path, "rb") {|f| send_data f.read, :filename => "search.xls"}
          File.delete(path) if File.exist?(path)
        end
      end
    else
      @sys_exports.each do |se|
        arr << (se.field_zh_name || se.field_en_name)
      end
      if !@temp.blank?
        crr = []
        r_no = 1 #控制行数
        crr[0] = arr
        @temp.each do |pid|
          brr = []
          @sys_exports.each do |se|
            brr.push pid.send(se.field_en_name)
          end
          crr[r_no] = brr
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
        File.open(path, "rb") {|f| send_data f.read, :filename => "search.xls"}
        File.delete(path) if File.exist?(path)
      end

    end
=end
  end

  def export
    #先判断一下导出项目的表中是否有字段，如果有再执行导出
    @sys_exports = SysExport.find(:all)
    if !@sys_exports.blank?
      filepath = File.join(Rails.root,'tmp/cache', "file.xls")
      path = File.join(Rails.root,'tmp/cache', Time.now.strftime('%Y%m%d%H%M').to_i.to_s + ".xls")
      book = POI::Workbook.open(filepath)
      sheet = book.worksheets[0]
      rows = sheet.rows
      #生成表头
      arr = []

      @sys_exports.each do |se|
        arr << se.field_zh_name || se.field_en_name
      end

      if !params[:huanzhe_x].blank?
        crr = []
        r_no = 1 #控制行数
        crr[0] = arr
        params[:huanzhe_x].each do |pid|
          brr = []
          @sys_exports.each do |se|
            if se.table_name == 'patient_infos'
              brr.push PatientInfo.find_by_id(pid).send(se.field_en_name)
            else
              brr.push eval(se.table_name.classify).find_by_patient_info_id(pid).send(se.field_en_name)
            end
          end

          crr[r_no] = brr
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
        File.open(path, "rb") {|f| send_data f.read, :filename => "search.xls"}
        File.delete(path) if File.exist?(path)

      end
    end

  end

  private

  def sys_export_params
    params.require(:sys_export).permit(:id,:field_en_name, :field_zh_name)
  end
end
