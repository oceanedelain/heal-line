class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true

  has_many_attached :files

  scope :upcoming, -> { where('at > ?', Date.today) }
  scope :past, -> { where('at < ?', Date.today) }

  include PgSearch::Model
  multisearchable against: [:notes, :description, :category]

  def name
    category
  end

  def details
    "Dr. #{doctor.first_name} #{doctor.last_name}"
  end

  def soon?
    self.at < Date.today + 7
  end


end
