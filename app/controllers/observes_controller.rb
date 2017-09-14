class ObservesController < ApplicationController
  before_action :set_obserf, only: [:show, :edit, :update, :destroy]
  layout 'item_form_metaelements'
  # GET /observes
  # GET /observes.json
  def index
    if params[:date].nil?
      @observes = Observe.all.where('patient_id=?', params[:patient_id].to_i)
    else
      @observes = Observe.where('patient_id=? and observe_date=?', params[:patient_id].to_i, params[:date].to_date)
    end

  end

  # GET /observes/1
  # GET /observes/1.json
  def show
  end

  # GET /observes/new
  def new
    @obserf = Observe.new
  end

  # GET /observes/1/edit
  def edit
  end

  # POST /observes
  # POST /observes.json
  def create
    params.permit!
    @obserf = Observe.new(obserf_params)

    respond_to do |format|
      if @obserf.save
        format.html { redirect_to :action => :index, :patient_id=>@obserf.patient_id, :patient_visit_id=>@obserf.patient_visit_id, :file_type=>params[:file_type] }
        format.json { render :show, status: :created, location: @obserf }
      else
        format.html { render :new }
        format.json { render json: @obserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observes/1
  # PATCH/PUT /observes/1.json
  def update
    respond_to do |format|
      #params['observe']['drug'] = params["observe"]["drug"].join(',')

      if @obserf.update(obserf_params)
        format.html { redirect_to :action => :index, :patient_id=>@obserf.patient_id, :patient_visit_id=>@obserf.patient_visit_id, :file_type=>params[:file_type] }
        format.json { render :show, status: :ok, location: @obserf }
      else
        format.html { render :edit }
        format.json { render json: @obserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observes/1
  # DELETE /observes/1.json
  def destroy
    patient_id = @obserf.patient_id
    patient_visit_id = @obserf.patient_visit_id
    @obserf.destroy
    respond_to do |format|
      format.html { redirect_to :action => :index, :patient_id=>patient_id, :patient_visit_id=>patient_visit_id, :file_type=>params[:file_type]  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obserf
      @obserf = Observe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obserf_params
      params.require(:observe).permit(:observe_date, :patient_id, :patient_visit_id, :observe_hour, :drug, :attack, :cause, :sleep_info, :has_before_cause,:attack_show,:duration,:duration_time,:environment_change,:other_drug,:observe_minute).
          merge({:attack_show=>(params[:observe][:attack_show].nil? ? nil : params[:observe][:attack_show].join(',')),:cause=>(params[:observe][:cause].nil? ? nil : params[:observe][:cause].join(',')),:environment_change=>(params[:observe][:environment_change].nil? ? nil : params[:observe][:environment_change].join(','))})
    end
end
