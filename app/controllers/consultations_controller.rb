class ConsultationsController < ApplicationController

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @consultations = policy_scope(Consultation).order(created_at: :desc)
    @consultations = @consultations.where(at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @symptoms = policy_scope(Symptom).order(created_at: :desc)
    @symptoms = @symptoms.where(at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @events = @consultations + @symptoms
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
      flash[:notice] = "Ma consultation a bien été ajoutée."
      redirect_to timeline_path(anchor: "consultation_#{@consultation.id}", params: { choice: 'consultation', focus: "consultation_#{@consultation.id}" })
    else
      render :new
    end
  end

  def show
    @consultation = Consultation.find(params[:id])
    @documents = Document.all
    authorize(@consultation)
  end

  def edit
    @consultation = Consultation.find(params[:id])
    authorize(@consultation)
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.update(consultation_params)
    authorize(@consultation)
    flash[:notice] = "Ma consultation a bien été éditée."
    redirect_to timeline_path
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    authorize(@consultation)
    redirect_to timeline_path
  end

  def fetch
    ids = params[:consultation_ids].split(',').map(&:to_i)
    @consultations = Consultation.where(id: ids)

    # require 'pry-byebug'; binding.pry
    skip_authorization

    respond_to do |format|
      format.json do
        response = {
          consultations: @consultations,
          html: render_to_string(partial: "pages/circles", locals: { consultations: @consultations }, layout: false, formats: :html)
         }
        render json: response.to_json
      end
    end
  end

  def link_document
    document = Document.find(params[:document][:id])
    @consultation = Consultation.find(params[:consultation_id])
    authorize @consultation
    document.consultation = @consultation
    if document.save!
      flash[:notice] = "Mon #{document.document_type} a bien été ajouté."
      redirect_to consultation_path(@consultation)
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:at, :category, :description, :notes, :doctor_id)
  end
end
