class AppointmentsController < ApplicationController
  before_action :set_patient
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  
  def index
    @appointments = @patient.appoointments
  end

  def show
  end

  def new
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if 
      @appointment.update(appointment_params)
      redirect_to index
    else
      render :edit
    end

    def destroy
      @appointment.destroy
      redirect_to index
    end

  end

  private
  def appointment_params
    params.require(:appointment).permit(:date_time, :doctor_id)
  end

  def set_appointment
    @appointment = @patient.appointments.find(params[:id])
  end
  
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
