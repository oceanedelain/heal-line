class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :consultations, dependent: :destroy
  has_many :doctors, through: :consultations
  has_many :symptoms, dependent: :destroy
  has_many :documents, dependent: :destroy

  has_one_attached :avatar

  def next_consultation
    consultations.upcoming.order(:at).first
  end

  def consultation_day?(day)
    Consultation.exists?(user: self, at: day.all_day)
  end

  def find_consultations(day)
    consultations.where(at: day.all_day)
  end
end
