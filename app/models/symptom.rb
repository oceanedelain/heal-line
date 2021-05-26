class Symptom < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many_attached :files

  def description
    text = "Intensité : #{intensity}/10 - Durée : #{duration} heure"
    text + 's' if duration > 1
  end

  def details
    zone
  end
end
