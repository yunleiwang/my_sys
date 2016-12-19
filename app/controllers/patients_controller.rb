class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all.order('id desc')
    Patient.attribute_names.each do |attr|
      attr
    end



  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient_visit = @patient.patient_visits.order('id asc').last
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @patient_visit = PatientVisit.new
    if params[:file_type].to_i==Patient::EASY
      @crf_info = CrfInfo.includes(:sections).where('crf_type=?',0).first
    end
  end

  # GET /patients/1/edit
  def edit
    @patient_visit = @patient.patient_visits.order('id asc').last

  end

  # POST /patients
  # POST /patients.json
  def create
    params.permit!
    if params[:patient][:file_type].to_i==Patient::DETAIL
      patient_params[:file_type]=Patient::DETAIL
    elsif params[:patient][:file_type].to_i==Patient::EASY
      patient_params[:file_type]=Patient::DETAIL
    end
    @patient = Patient.new(patient_params)
    respond_to do |format|
      if @patient.save
        patient_visit = PatientVisit.new(params[:patient_visit])
        patient_visit.patient_id=@patient.id
        patient_visit.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    params.permit!
    if params[:patient][:file_type].to_i==Patient::DETAIL
      patient_params[:file_type]=Patient::DETAIL
    end
    respond_to do |format|
      if @patient.update(patient_params)
        @patient_visit = PatientVisit.find(params[:patient_visit][:id])
        @patient_visit.update(params[:patient_visit])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:file_number, :id_number, :name, :gender, :birthday, :nation, :native_place, :file_type)
    end
end
