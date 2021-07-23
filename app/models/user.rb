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
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    # if avatar.attached?
    #   avatar.variant(resize: "150x150!").processed
    # else
      '/default-avatar.jpg'
    # end
  end

  def next_consultation
    consultations.upcoming.order(:at).first
  end

  def consultation_day?(day)
    Consultation.exists?(user: self, at: day.all_day)
  end

  def find_consultations(day)
    consultations.where(at: day.all_day)
  end

  def consultations_group_by_day
    consultations.upcoming.order(at: :asc).group_by { |consultation| consultation.at.to_date }
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default-avatar.jpg'
        )
      ), filename: 'default-avatar.jpg',
      content_type: 'image/jpg'
      )
    end
  end
end
