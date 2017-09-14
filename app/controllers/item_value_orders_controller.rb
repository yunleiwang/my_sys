class ItemValueOrdersController < ApplicationController
  before_action :set_item_value_order, only: [:show, :edit, :update, :destroy]
  layout 'item_form_metaelements'
  # GET /item_value_orders
  # GET /item_value_orders.json
  def index
    menus_crf_info_id = params[:menus_crf_info_id].to_i
    patient_visit_id = params[:patient_visit_id].to_i
    @item_value_orders = ItemValueOrder.where('menus_crf_info_id = ? and patient_visit_id = ?', menus_crf_info_id, patient_visit_id).order('ordinal asc').includes(:item_values)
    if @item_value_orders.empty?
      redirect_to action: :new , :menus_crf_info_id=>menus_crf_info_id,:patient_visit_id=>patient_visit_id,:patient_id=>params[:patient_id],:crf_info_id=>params[:crf_info_id]
    end
  end

  # GET /item_value_orders/1
  # GET /item_value_orders/1.json
  def show
  end

  # GET /item_value_orders/new
  def new
    #@item_value_order = ItemValueOrder.new
    #@item_form_metaelement = ItemFormMetaelement.new
    menus_crf_info_id = params[:menus_crf_info_id]
    menus_crf_info = MenusCrfInfo.find(menus_crf_info_id)
    @sections = []
    if menus_crf_info
      crf_info = menus_crf_info.crf_info
      @sections = crf_info.sections
    end
  end

  # GET /item_value_orders/1/edit
  def edit
    @item_values = @item_value_order.item_values
    @sections = []
    if !params[:crf_info_id].nil?
      crf_info_id = params[:crf_info_id]
      @sections = CrfInfo.find(crf_info_id).sections
    end

  end

  # POST /item_value_orders
  # POST /item_value_orders.json
  def create

    patient_id = params[:patient_id].to_i
    patient_visit_id = params[:patient_visit_id].to_i
    menus_crf_info_id = params[:menus_crf_info_id].to_i
    menus_crf_info = MenusCrfInfo.find(menus_crf_info_id)
    item_value_order = ItemValueOrder.where('menus_crf_info_id=? and patient_visit_id=?', menus_crf_info_id, patient_visit_id).select('max(ordinal) as max_ordinal').collect{|o|o.max_ordinal}
    max_ordinal = item_value_order[0].to_i

    ItemValueOrder.transaction do
      item_value_order = ItemValueOrder.create(
          :crf_info_id => menus_crf_info.crf_info_id,
          :menus_crf_info_id => menus_crf_info_id,
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
            :menus_crf_info_id => menus_crf_info_id,
        )
      end
    end

    redirect_to :action => :index, :menus_crf_info_id => menus_crf_info_id, :patient_visit_id => patient_visit_id, :patient_id => patient_id, :crf_info_id=>menus_crf_info.crf_info_id
  end

  # PATCH/PUT /item_value_orders/1
  # PATCH/PUT /item_value_orders/1.json
  def update
    patient_id = params[:patient_id].to_i
    patient_visit_id = params[:patient_visit_id].to_i
    menus_crf_info_id = params[:menus_crf_info_id].to_i
    menus_crf_info = MenusCrfInfo.find(menus_crf_info_id)

    item_params = params.select{|key,value| key =~ /^item/}
    item_params.each do |key, value|
      arr = key.split("_")
      logger.debug arr
      item_group_id = arr[1]
      item_group_ordinal = arr[2]
      item_id = arr[3].to_i
      item_values = @item_value_order.item_values
      #~~~~~~~~~~~~~~~~~~~~~group中item~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # item 为group中的，则删除原来的值，重新创建value，如果是普通item，则直接update
      if !item_group_id.blank?
        # 查找是否有该条目的值
        item_value = item_values.find{|iv| iv.item_group_id==item_group_id && iv.item_group_ordinal==item_group_ordinal && iv.item_id==item_id}
        group_item_values = item_values.select{|iv|iv.item_group_id==item_group_id}
        group_item_values.delete_all unless group_item_values.empty?
        # 如果该条目值为空，则创建
        if item_value.nil?
          ItemValue.create(
              :item_id => item_id,
              :value => value,
              :patient_id => patient_id,
              :patient_visit_id => patient_visit_id,
              :item_value_order_id => @item_value_order.id,
              :item_group_id => item_group_id,
              :item_group_ordinal => item_group_ordinal,
              :menus_crf_info_id => menus_crf_info_id,
          )
        end
      # ~~~~~~~~~~~~~~~~~~~~~~普通item~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # 普通item，则直接update,如果没有该条目的值则创建
      else
        # 查找是否有该条目的值
        item_value = item_values.find{|iv|  iv.item_id==item_id}
        # 如果该条目值为空，则创建
        if item_value.nil?
          ItemValue.create(
              :item_id => item_id,
              :value => value,
              :patient_id => patient_id,
              :patient_visit_id => patient_visit_id,
              :item_value_order_id => @item_value_order.id,
              :item_group_id => item_group_id,
              :item_group_ordinal => item_group_ordinal,
              :menus_crf_info_id => menus_crf_info_id,
          )
          # 如果条目值不为空则更新
        else
          item_value.update(:value=>value)
        end
      end
    end
    redirect_to :action => :index, :menus_crf_info_id => menus_crf_info_id, :patient_visit_id => patient_visit_id, :patient_id=>patient_id, :crf_info_id=>menus_crf_info.crf_info_id
  end

  # DELETE /item_value_orders/1
  # DELETE /item_value_orders/1.json
  def destroy
    patient_id = @item_value_order.patient_id
    patient_visit_id = @item_value_order.patient_visit_id
    menus_crf_info_id = @item_value_order.menus_crf_info_id
    menus_crf_info = MenusCrfInfo.find(menus_crf_info_id)
    @item_value_order.destroy
    redirect_to :action => :index, :menus_crf_info_id => menus_crf_info_id, :patient_visit_id => patient_visit_id, :patient_id => patient_id, :crf_info_id=>menus_crf_info.crf_info_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_value_order
      @item_value_order = ItemValueOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_value_order_params
      params.require(:item_value_order).permit(:patient_id, :patient_visit_id, :complete, :ordinal, :user_id, :history, :status, :crf_info_id, :menus_crf_info_id)
    end
end
