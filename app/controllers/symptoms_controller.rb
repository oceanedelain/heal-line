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
      redirect_to timeline_path(anchor: "symptom_#{@symptom.id}", params: { choice: 'symptom', focus: "symptom_#{@symptom.id}" })
    else
      render :new
    end
  end

  def edit
    @symptom = Symptom.find(params[:id])
    authorize(@symptom)
  end

  def update
    @symptom.update(symptom_params)
    authorize(@symptom)
    redirect_to timeline_path
  end

  private

  def symptom_params
    params.require(:symptom).permit(:at, :name, :zone, :intensity, :notes, :duration, :user_id)
  end
end
