class SymptomsController < ApplicationController

  # def index
  #   @consultations = policy_scope(Consultation).order(created_at: :desc)
  # end

  def new
    @symptom = Symptom.new
    authorize(@symptom)
  end

  def create
    @symptom = Symptom.new(symptom_params)
    authorize(@symptom)
    @symptom.user = current_user

    if @symptom.save
      redirect_to timeline_path
    else
      render :new
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:date, :name, :zone, :intensity, :notes, :duration, :user_id)
  end
end
