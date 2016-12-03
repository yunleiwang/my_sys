class MenusCrfInfosController < ApplicationController
  before_action :set_menus_crf_info, only: [:show, :edit, :update, :destroy]

  # GET /menus_crf_infos
  # GET /menus_crf_infos.json
  def index
    @menus = Menu.where("menu_type!=0").order('menu_type,seq asc')
    @crf_infos = CrfInfo.order('seq asc')
    @menus_crf_infos = MenusCrfInfo.order('seq asc')
  end

  # GET /menus_crf_infos/1
  # GET /menus_crf_infos/1.json
  def show
  end

  # GET /menus_crf_infos/new
  def new
    @menus_crf_info = MenusCrfInfo.new
  end

  # GET /menus_crf_infos/1/edit
  def edit
  end

  # POST /menus_crf_infos
  # POST /menus_crf_infos.json
  def create
    #@menus_crf_info = MenusCrfInfo.new(menus_crf_info_params)
    #MenusCrfInfo.delete_all
    params.permit!
    params[:results].each do |result|
      arr = result.split('_')
      menu_id = arr[0]
      crf_info_id = arr[1]
      MenusCrfInfo.create(:menu_id=>menu_id, :crf_info_id=>crf_info_id)
    end

    respond_to do |format|
      #if @menus_crf_info.save
      if true
        format.html { redirect_to @menus_crf_info, notice: 'Menus crf info was successfully created.' }
        format.json { render :show, status: :created, location: @menus_crf_info }
      else
        format.html { render :new }
        format.json { render json: @menus_crf_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus_crf_infos/1
  # PATCH/PUT /menus_crf_infos/1.json
  def update
    respond_to do |format|
      if @menus_crf_info.update(menus_crf_info_params)
        format.html { redirect_to @menus_crf_info, notice: 'Menus crf info was successfully updated.' }
        format.json { render :show, status: :ok, location: @menus_crf_info }
      else
        format.html { render :edit }
        format.json { render json: @menus_crf_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus_crf_infos/1
  # DELETE /menus_crf_infos/1.json
  def destroy
    @menus_crf_info.destroy
    respond_to do |format|
      format.html { redirect_to menus_crf_infos_url, notice: 'Menus crf info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menus_crf_info
      @menus_crf_info = MenusCrfInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menus_crf_info_params
      params.require(:menus_crf_info).permit(:menu_id, :crf_info_id)
    end
end
