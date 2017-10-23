class EncountersController < ApplicationController
  include FlashMessages

  before_action :get_encounter, only: [:show, :edit, :update, :destroy]

  def new
    @encounter = Encounter.new(patient_id:params[:id])
    $patient_id = @encounter.patient_id
  end

  def show
  end

  def edit
  end

  def update
    if params[:cancel].present?
      flash[:notice] = MAIN_PAGE_MESSAGE
    elsif @encounter.update_attributes(encounter_params)
    flash[:notice] = UPDATE_MESSAGE + " Encounter!"
    else
      if @encounter.errors.any?
      flash[:alert] = @encounter.errors.full_messages
      end
    end
    redirect_to main_page_path
  end

  def create
    @encounter = Encounter.new(encounter_params)
    @encounter.update(patient_id: $patient_id)

    if params[:cancel].present?
      flash[:notice] = MAIN_PAGE_MESSAGE
    elsif @encounter.save
      flash[:notice] = SUCCESS_MESSAGE + " encounter!."
    else
      if @encounter.errors.any?
        flash[:alert] = @encounter.errors.full_messages
      end
    end
    redirect_to main_page_path
  end

  def destroy
    @encounter.destroy
    flash[:notice] = "Encounter deleted"
    @patient = Patient.find_by(id:$patient_id)
    redirect_to patientss_path(@patient)
  end

  private

  def encounter_params
    params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
  end

  def get_encounter
    @encounter = Encounter.find(params[:id])
  end
end
