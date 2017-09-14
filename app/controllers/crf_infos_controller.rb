#coding:utf-8
class CrfInfosController < ApplicationController
  before_action :set_crf_info, only: [:show, :edit, :update, :destroy]
  #layout false
  # GET /crf_infos
  # GET /crf_infos.json
  def index
    # file_path = File.join(Rails.root, "doc")
    # CrfInfo.new.import(file_path)
    #filepath = File.join(Rails.root, "doc", "癫痫", "病历简况.xls")
    # filepath = File.join(Rails.root, "doc", "癫痫", "癫痫发作及诊治.xls")
    #filepath = File.join(Rails.root, "doc", "癫痫", "发育评估.xls")
    #filepath = File.join(Rails.root, "doc", "癫痫", "既往史.xls")
    #filepath = File.join(Rails.root, "doc", "癫痫", "脑电图检查.xls")
    #filepath = File.join(Rails.root, "doc", "癫痫", "头颅MRI检查.xls")
    #filepath = File.join(Rails.root, "doc", "癫痫", "入组筛选表.xls")
    # filepath = File.join(Rails.root, "doc", "癫痫", "遗传代谢病及基因检查.xls")
    #CrfInfo.new.import_crf(filepath)
    # MenusCrfInfo.create()
    @crf_infos = CrfInfo.all
    #MenusCrfInfo.create
  end

  # GET /crf_infos/1
  # GET /crf_infos/1.json
  def show
  end

  # GET /crf_infos/new
  def new
    @crf_info = CrfInfo.new
  end

  # GET /crf_infos/1/edit
  def edit
  end

  # POST /crf_infos
  # POST /crf_infos.json
  def create
    @crf_info = CrfInfo.new(crf_info_params)

    respond_to do |format|
      if @crf_info.save
        format.html { redirect_to @crf_info, notice: 'Crf info was successfully created.' }
        format.json { render :show, status: :created, location: @crf_info }
      else
        format.html { render :new }
        format.json { render json: @crf_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crf_infos/1
  # PATCH/PUT /crf_infos/1.json
  def update
    respond_to do |format|
      if @crf_info.update(crf_info_params)
        format.html { redirect_to @crf_info, notice: 'Crf info was successfully updated.' }
        format.json { render :show, status: :ok, location: @crf_info }
      else
        format.html { render :edit }
        format.json { render json: @crf_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crf_infos/1
  # DELETE /crf_infos/1.json
  def destroy
    @crf_info.destroy
    respond_to do |format|
      format.html { redirect_to crf_infos_url, notice: 'Crf info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crf_info
      @crf_info = CrfInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crf_info_params
      params.require(:crf_info).permit(:name, :description, :seq, :crf_type, :follow)
    end
end
