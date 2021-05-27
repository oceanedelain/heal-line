class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @scrolling_days = ((Date.today - 3.days)..(Date.today + 14.days)).to_a
    @consultation = Consultation.where('at > ?', DateTime.now).first
  end

  def timeline
    @data = [Consultation.all, Symptom.all].flatten.sort_by { |item| item.at }
  end
end
