class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @scrolling_days = (Date.today.beginning_of_week..Date.today.end_of_week + 14.days).to_a
    @consultation = Consultation.where('at > ?', DateTime.now).first
  end

  def timeline
    @data = [Consultation.all, Symptom.all].flatten.sort_by { |item| item.at }
  end

  def profile
    @doctors = current_user.doctors
  end
end
