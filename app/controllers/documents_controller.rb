class DocumentsController < ApplicationController

  def index
    @documents = policy_scope(Document).order(created_at: :desc)
  end

  def new
    @document = Document.new
    authorize(@document)
  end

  def create
    @document = Document.new(document_params)
    authorize(@document)
    @document.user = current_user

    if @document.save
      flash[:notice] = "Mon #{@document.name} a bien été ajouté."
      redirect_to timeline_path
    else
      render :new
    end
  end

  private

  def document_params
    params.require(:document).permit(:at, :name, :notes, :document_type, :consultation_id, :user_id, :file)
  end
end

