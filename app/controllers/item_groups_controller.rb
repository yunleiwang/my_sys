class ItemGroupsController < ApplicationController
  before_action :set_item_group, only: [:show, :edit, :update, :destroy]

  # GET /item_groups
  # GET /item_groups.json
  def index
    @item_groups = ItemGroup.all
  end

  # GET /item_groups/1
  # GET /item_groups/1.json
  def show
  end

  # GET /item_groups/new
  def new
    @item_group = ItemGroup.new
  end

  # GET /item_groups/1/edit
  def edit
  end

  # POST /item_groups
  # POST /item_groups.json
  def create
    @item_group = ItemGroup.new(item_group_params)

    respond_to do |format|
      if @item_group.save
        format.html { redirect_to @item_group, notice: 'Item group was successfully created.' }
        format.json { render :show, status: :created, location: @item_group }
      else
        format.html { render :new }
        format.json { render json: @item_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_groups/1
  # PATCH/PUT /item_groups/1.json
  def update
    respond_to do |format|
      if @item_group.update(item_group_params)
        format.html { redirect_to @item_group, notice: 'Item group was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_group }
      else
        format.html { render :edit }
        format.json { render json: @item_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_groups/1
  # DELETE /item_groups/1.json
  def destroy
    @item_group.destroy
    respond_to do |format|
      format.html { redirect_to item_groups_url, notice: 'Item group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_item_group
    @item_group = ItemGroup.find(params[:id])
    @num = params[:num]
    @items = @item_group.items
  end

  def remove_item_group
    respond_to do |format|
      format.html
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_group
      @item_group = ItemGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_group_params
      params.require(:item_group).permit(:name, :description)
    end
end
