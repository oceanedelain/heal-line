class ConsultationsController < ApplicationController
  def new
    @consultation = Consultation.new
  end
end
