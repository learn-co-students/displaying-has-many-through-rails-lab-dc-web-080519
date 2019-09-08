class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(p_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(p_params)
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  private

  def p_params
    params.require(:patient).permit(:name, :department)
  end
end
