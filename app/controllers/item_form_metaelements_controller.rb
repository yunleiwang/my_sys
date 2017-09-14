class ItemFormMetaelementsController < ApplicationController
  before_action :set_item_form_metaelement, only: [:show, :edit, :update, :destroy]
  layout 'item_form_metaelements'
  # GET /item_form_metaelements
  # GET /item_form_metaelements.json
  def index
    if params[:crf_info_id].nil?
      crf_info_id = Menu.find(params["menu_type"]).crf_infos.first.id
    else
      crf_info_id = params[:crf_info_id]
    end

    #@item_form_metaelements = ItemFormMetaelement.where(crf_info_id: crf_info_id).includes(:item).order('id asc')
    #@sections = CrfInfo.find(crf_info_id).sections

  end

  # GET /item_form_metaelements/1
  # GET /item_form_metaelements/1.json
  def show
  end

  # GET /item_form_metaelements/new
  def new
    @item_form_metaelement = ItemFormMetaelement.new
    @sections = []
    if !params[:crf_info_id].nil?
      crf_info_id = params[:crf_info_id]
      @sections = CrfInfo.find(crf_info_id).sections
    end


    #@item_form_metaelements = ItemFormMetaelement.where(crf_info_id: crf_info_id).includes(:item)
  end

  # GET /item_form_metaelements/1/edit
  def edit
  end

  # POST /item_form_metaelements
  # POST /item_form_metaelements.json
  def create
#    @item_form_metaelement = ItemFormMetaelement.new(item_form_metaelement_params)
    crf_info_id = params[:crf_info_id].to_i
    menu_id = params[:menu_id].to_i
    patient_id = params[:patient_id].to_i
    patient_visit_id = params[:patient_visit_id].to_i

    item_value_order = ItemValueOrder.where('menus_crf_info_id=? and patient_visit_id=?', crf_info_id, patient_visit_id).select('max(ordinal) as max_ordinal').collect{|o|o.max_ordinal}
    max_ordinal = item_value_order[0].to_i

    menus_crf_info = MenusCrfInfo.find_by_crf_info_id_and_menu_id(crf_info_id, menu_id)
    ItemValueOrder.transaction do
      item_value_order = ItemValueOrder.create(
          :crf_info_id => crf_info_id,
          :menus_crf_info_id => menus_crf_info.id,
          :patient_id => patient_id,
          :patient_visit_id => patient_visit_id,
          :ordinal => max_ordinal+1
      )

      item_params = params.select{|key,value| key =~ /^item/}
      item_params.each do |key, value|
        arr = key.split("_")
        item_group_id = arr[1]
        item_group_ordinal = arr[2]
        item_id = arr[3]
        ItemValue.create(
          :item_id => item_id,
          :value => value,
          :patient_id => patient_id,
          :patient_visit_id => patient_visit_id,
          :item_value_order_id => item_value_order.id,
          :item_group_id => item_group_id,
          :item_group_ordinal => item_group_ordinal,
          :menus_crf_info_id => menus_crf_info.id,
        )
      end
    end

    respond_to do |format|
      #if @item_form_metaelement.save
      if true
        format.html { redirect_to @item_form_metaelement, notice: 'Item form metaelement was successfully created.' }
        format.json { render :show, status: :created, location: @item_form_metaelement }
      else
        format.html { render :new }
        format.json { render json: @item_form_metaelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_form_metaelements/1
  # PATCH/PUT /item_form_metaelements/1.json
  def update
    respond_to do |format|
      if @item_form_metaelement.update(item_form_metaelement_params)
        format.html { redirect_to @item_form_metaelement, notice: 'Item form metaelement was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_form_metaelement }
      else
        format.html { render :edit }
        format.json { render json: @item_form_metaelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_form_metaelements/1
  # DELETE /item_form_metaelements/1.json
  def destroy
    @item_form_metaelement.destroy
    respond_to do |format|
      format.html { redirect_to item_form_metaelements_url, notice: 'Item form metaelement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_form_metaelement
      @item_form_metaelement = ItemFormMetaelement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_form_metaelement_params
      params.require(:item_form_metaelement).permit(:no, :parentno, :item_id, :crf_info_id, :section_id, :header, :subheader, :parent_id, :ordinal, :required, :show_item, :trigger, :options_index, :item_group_id)
    end
end
