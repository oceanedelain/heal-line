class DocumentsController < ApplicationController

  def index
    @documents = policy_scope(Document).order(at: :desc)

    if params[:query].present?
      @documents = Document.search_by_attr(params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { documents: @documents } }
    end
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
      redirect_to documents_path
    else
      render :new
    end
  end

  private

  def document_params
    params.require(:document).permit(:at, :name, :notes, :document_type, :consultation_id, :user_id, :file)
  end
end

