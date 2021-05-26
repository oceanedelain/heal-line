class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @consultation = Consultation.where('date > ?', Date.today).first
    @scrolling_days = (Date.today.beginning_of_week..Date.today.end_of_week + 14.days).to_a
    @consultation_soon = Consultation.where('date > ?', Date.today)
    # @consultation = Consultation.where('at > ?', DateTime.now).first
  end

  def timeline
    @consultations = Consultation.all
  end
end
