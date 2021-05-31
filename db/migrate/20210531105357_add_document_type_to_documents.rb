class AddDocumentTypeToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :document_type, :string
  end
end
