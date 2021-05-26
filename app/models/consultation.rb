class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true

  has_many_attached :files

  def name
    category
  end

  def details
    "Dr. #{doctor.first_name} #{doctor.last_name}"
  end

end
