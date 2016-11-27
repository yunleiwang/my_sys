class ItemFormMetaelementsController < ApplicationController
  before_action :set_item_form_metaelement, only: [:show, :edit, :update, :destroy]

  # GET /item_form_metaelements
  # GET /item_form_metaelements.json
  def index
    # crf_info_id = params[:crf_info_id]
    crf_info_id = 17
    @item_form_metaelements = ItemFormMetaelement.where(crf_info_id: crf_info_id).includes(:item).order('id asc')
    #@sections = CrfInfo.find(crf_info_id).sections
  end

  # GET /item_form_metaelements/1
  # GET /item_form_metaelements/1.json
  def show
  end

  # GET /item_form_metaelements/new
  def new
    @item_form_metaelement = ItemFormMetaelement.new
    crf_info_id = 17
    @sections = CrfInfo.find(crf_info_id).sections
    #@item_form_metaelements = ItemFormMetaelement.where(crf_info_id: crf_info_id).includes(:item)
  end

  # GET /item_form_metaelements/1/edit
  def edit
  end

  # POST /item_form_metaelements
  # POST /item_form_metaelements.json
  def create
    @item_form_metaelement = ItemFormMetaelement.new(item_form_metaelement_params)

    respond_to do |format|
      if @item_form_metaelement.save
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
