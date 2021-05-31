class Document < ApplicationRecord
  belongs_to :user
  belongs_to :consultation, optional: true
  belongs_to :symptom, optional: true

  has_one_attached :file
end
