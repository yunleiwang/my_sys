class PublicLibsController < ApplicationController
  before_action :set_public_lib, only: [:show, :edit, :update, :destroy]

  # GET /public_libs
  # GET /public_libs.json
  def index
    @public_libs = PublicLib.all
  end

  # GET /public_libs/1
  # GET /public_libs/1.json
  def show
  end

  # GET /public_libs/new
  def new
    @public_lib = PublicLib.new
  end

  # GET /public_libs/1/edit
  def edit
  end

  # POST /public_libs
  # POST /public_libs.json
  def create
    @public_lib = PublicLib.new(public_lib_params)

    respond_to do |format|
      if @public_lib.save
        format.html { redirect_to @public_lib, notice: 'Public lib was successfully created.' }
        format.json { render :show, status: :created, location: @public_lib }
      else
        format.html { render :new }
        format.json { render json: @public_lib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_libs/1
  # PATCH/PUT /public_libs/1.json
  def update
    respond_to do |format|
      if @public_lib.update(public_lib_params)
        format.html { redirect_to @public_lib, notice: 'Public lib was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_lib }
      else
        format.html { render :edit }
        format.json { render json: @public_lib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_libs/1
  # DELETE /public_libs/1.json
  def destroy
    @public_lib.destroy
    respond_to do |format|
      format.html { redirect_to public_libs_url, notice: 'Public lib was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_lib
      @public_lib = PublicLib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_lib_params
      params.require(:public_lib).permit(:table_name, :item_name, :item_text, :item_value, :pinyin)
    end
end
