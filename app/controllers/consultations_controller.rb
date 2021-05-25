class ConsultationsController < ApplicationController

  def index
    @consultations = policy_scope(Consultation).order(created_at: :desc)
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    authorize(@consultation)
    @consultation.user = current_user

    if @consultation.save
      redirect_to timeline_path
    else
      render :new
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:date, :time, :category, :description, :notes, :doctor_id)
  end
end
