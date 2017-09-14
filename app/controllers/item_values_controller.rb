class ItemValuesController < ApplicationController
  before_action :set_item_value, only: [:show, :edit, :update, :destroy]

  # GET /item_values
  # GET /item_values.json
  def index
    @item_values = ItemValue.all
  end

  # GET /item_values/1
  # GET /item_values/1.json
  def show
  end

  # GET /item_values/new
  def new
    @item_value = ItemValue.new
  end

  # GET /item_values/1/edit
  def edit
  end

  # POST /item_values
  # POST /item_values.json
  def create
    @item_value = ItemValue.new(item_value_params)

    respond_to do |format|
      if @item_value.save
        format.html { redirect_to @item_value, notice: 'Item value was successfully created.' }
        format.json { render :show, status: :created, location: @item_value }
      else
        format.html { render :new }
        format.json { render json: @item_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_values/1
  # PATCH/PUT /item_values/1.json
  def update
    respond_to do |format|
      if @item_value.update(item_value_params)
        format.html { redirect_to @item_value, notice: 'Item value was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_value }
      else
        format.html { render :edit }
        format.json { render json: @item_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_values/1
  # DELETE /item_values/1.json
  def destroy
    @item_value.destroy
    respond_to do |format|
      format.html { redirect_to item_values_url, notice: 'Item value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_value
      @item_value = ItemValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_value_params
      params.require(:item_value).permit(:item_id, :value, :patient_id, :menus_crf_info_id, :patient_visit_id, :item_value_order_id)
    end
end
