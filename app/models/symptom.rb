class Symptom < ApplicationRecord
  belongs_to :user
  has_many :documents

  include PgSearch::Model
  multisearchable against: [:name, :zone, :notes]

  def description
    text = "Intensité : #{intensity}/10 - Durée : #{duration} heure"
    text + 's' if duration > 1
  end

  def details
    zone
  end
end
