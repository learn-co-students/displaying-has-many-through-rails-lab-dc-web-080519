class AppointmentsController < ApplicationController
  def new
    @appointment = Appoinment.new
  end

  def create
    @appointment = Appointment.new(appt_params)
    @appoint.save
    redirect_to appointment_path(@appointment)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appt_params
    params.require(:appointment).permit(:appointment_datetime, :doctor_id, :patient_id)
  end
end
