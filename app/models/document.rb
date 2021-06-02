class Document < ApplicationRecord
  belongs_to :user
  belongs_to :consultation, optional: true
  belongs_to :symptom, optional: true

  has_one_attached :file

  include PgSearch::Model
  pg_search_scope :search_by_attr,
    against: [:name, :document_type, :notes],
    using: {
      tsearch: { prefix: true }
    }
end
