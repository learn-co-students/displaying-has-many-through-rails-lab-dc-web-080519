class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(d_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(d_params)
      redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  private

  def d_params
    params.require(:doctor).permit(:name, :department)
  end
end
