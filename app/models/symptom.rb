class Symptom < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many_attached :files
end
