class PatientsController < ApplicationController
  include FlashMessages

  before_action :find_patient, only: [:show, :edit, :update, :destroy]

  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all
  end

  def show
    @encounters = @patient.encounters
  end

  def edit
  end

  def update
    if params[:cancel].present?
      flash[:notice] = MAIN_PAGE_MESSAGE
    elsif @patient.update_attributes(patient_params)
    flash[:notice] = UPDATE_MESSAGE + " Patient!"
    else
      if @patient.errors.any?
      flash[:alert] = @patient.errors.full_messages
      end
    end
    redirect_to main_page_path
  end

  def create
    @patient = Patient.new(patient_params)
    if params[:cancel].present?
      flash[:notice] = MAIN_PAGE_MESSAGE
    elsif @patient.save
      flash[:notice] = SUCCESS_MESSAGE + " Patient!."
    else
      if @patient.errors.any?
        flash[:alert] = @patient.errors.full_messages
      end
    end
    redirect_to main_page_path
  end

  def destroy
    byebug
    @patient.encounters.destroy_all
    @patient.destroy
    flash[:notice] = "Patient deleted"
    redirect_to main_page_path
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :middle_name, :weight, :height, :mrn)
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end
end
