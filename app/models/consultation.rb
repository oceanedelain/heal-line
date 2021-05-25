class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true
  
  has_many_attached :files
end
