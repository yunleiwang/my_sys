class ItemGroupMetaelementsController < ApplicationController
  before_action :set_item_group_metaelement, only: [:show, :edit, :update, :destroy]

  # GET /item_group_metaelements
  # GET /item_group_metaelements.json
  def index
    @item_group_metaelements = ItemGroupMetaelement.all
  end

  # GET /item_group_metaelements/1
  # GET /item_group_metaelements/1.json
  def show
  end

  # GET /item_group_metaelements/new
  def new
    @item_group_metaelement = ItemGroupMetaelement.new
  end

  # GET /item_group_metaelements/1/edit
  def edit
  end

  # POST /item_group_metaelements
  # POST /item_group_metaelements.json
  def create
    @item_group_metaelement = ItemGroupMetaelement.new(item_group_metaelement_params)

    respond_to do |format|
      if @item_group_metaelement.save
        format.html { redirect_to @item_group_metaelement, notice: 'Item group metaelement was successfully created.' }
        format.json { render :show, status: :created, location: @item_group_metaelement }
      else
        format.html { render :new }
        format.json { render json: @item_group_metaelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_group_metaelements/1
  # PATCH/PUT /item_group_metaelements/1.json
  def update
    respond_to do |format|
      if @item_group_metaelement.update(item_group_metaelement_params)
        format.html { redirect_to @item_group_metaelement, notice: 'Item group metaelement was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_group_metaelement }
      else
        format.html { render :edit }
        format.json { render json: @item_group_metaelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_group_metaelements/1
  # DELETE /item_group_metaelements/1.json
  def destroy
    @item_group_metaelement.destroy
    respond_to do |format|
      format.html { redirect_to item_group_metaelements_url, notice: 'Item group metaelement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_group_metaelement
      @item_group_metaelement = ItemGroupMetaelement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_group_metaelement_params
      params.require(:item_group_metaelement).permit(:no, :parentno, :item_group_id, :crf_info_id, :header, :subheader, :repeat_number, :repeat_max, :item_id, :seq, :show_group, :repeating_group, :options_index)
    end
end
