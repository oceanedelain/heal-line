class Doctor < ApplicationRecord
  has_many :consultations, dependent: :destroy

end
