class Doctor < ApplicationRecord
  has_many :consultations, dependent: :destroy


  def name
    "#{first_name} #{last_name} (#{specialty})"
  end

end
