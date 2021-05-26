class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @consultation = Consultation.find(params[:id])
  end

  def timeline
    @data = [Consultation.all, Symptom.all].flatten.sort_by { |item| item.at }
  end
end
