class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  has_many_attached :files
end
