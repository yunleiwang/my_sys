class ObservesController < ApplicationController
  before_action :set_obserf, only: [:show, :edit, :update, :destroy]
  layout 'item_form_metaelements'
  # GET /observes
  # GET /observes.json
  # 数据格式如下
  # [
  #     {
  #         "date": '2017-09-05',
  #         "1": {
  #             "drug": "A",
  #             "attack": 1,
  #             "cause": "B",
  #             "sleep_info": "是"
  #         },
  #         "2": {
  #             "drug": "A",
  #             "attack": 1,
  #             "cause": "B",
  #             "sleep_info": "是"
  #         }
  #     }
  # ]
  def index
    observe_dates = Observe.where('patient_id=?', params[:patient_id].to_i).order('observe_date asc').pluck(:observe_date).uniq
    @data = []
    observe_dates.each do |observe_date|
      hash = {:date=>observe_date}
      observes = Observe.where('patient_id=? and observe_date=?', params[:patient_id].to_i,observe_date)
      (1..24).each do |hour|
        hour_observes = observes.select{|observe| observe.observe_hour==hour}
         date_hash={
            "drug"=> hour_observes.collect{|hour_observe|"<a class='pjax-link' href='/observes/#{hour_observe.id}/edit?patient_id=#{params[:patient_id]}'>"+hour_observe.drug.to_s+"</a>"}.join(' '),
            "attack"=> hour_observes.collect{|hour_observe| "<a class='pjax-link' href='/observes/#{hour_observe.id}/edit?patient_id=#{params[:patient_id]}'>"+ (hour_observe.attack==1? '是' : "否")+"</a>"}.join(' '),
            "cause"=> hour_observes.collect{|hour_observe|"<a class='pjax-link' href='/observes/#{hour_observe.id}/edit?patient_id=#{params[:patient_id]}'>"+hour_observe.cause.to_s+"</a>"}.join(' '),
            "sleep_info"=> hour_observes.collect{|hour_observe|"<a class='pjax-link' href='/observes/#{hour_observe.id}/edit?patient_id=#{params[:patient_id]}'>"+ hour_observe.sleep_info.to_s+"</a>"}.join(' '),
        }
        hash[hour.to_s] = date_hash
      end
      @data << hash
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
