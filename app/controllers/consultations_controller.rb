class ConsultationsController < ApplicationController

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @consultations = policy_scope(Consultation).order(created_at: :desc)
    @consultations = @consultations.where(at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @consultation = Consultation.new
    authorize(@consultation)
  end

  def create
    @consultation = Consultation.new(consultation_params)
    authorize(@consultation)
    @consultation.user = current_user

    if @consultation.save
      redirect_to timeline_path(anchor: "consultation_#{@consultation.id}", params: { choice: 'consultation', focus: "consultation_#{@consultation.id}" })
    else
      render :new
    end
  end

  def edit
    @consultation = Consultation.find(params[:id])
    authorize(@consultation)
  end

  def update
    @consultation.update(consultation_params)
    authorize(@consultation)
    redirect_to timeline_path
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    authorize(@consultation)
    redirect_to timeline_path
  end


  private

  def consultation_params
    params.require(:consultation).permit(:at, :category, :description, :notes, :doctor_id)
  end
end
