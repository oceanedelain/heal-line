class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @consultation = Consultation.find(params[:id])
  end

  def timeline
  end
end
