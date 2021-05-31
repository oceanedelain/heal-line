class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @scrolling_days = ((Date.today - 3.days)..(Date.today + 14.days)).to_a
    @consultation = Consultation.where('at > ?', DateTime.now).first
  end

  def timeline
    if params[:query].present?
      @data = PgSearch.multisearch(params[:query])
    else
      @data = PgSearch::Document.all
    end

    if params.dig(:choice) == 'symptom'
      @data = @data.select { |pg_doc| pg_doc.searchable_type == "Symptom" }
    elsif params.dig(:choice) == 'consultation'
      @data = @data.select { |pg_doc| pg_doc.searchable_type == "Consultation" }
    end

    params[:focus] ||= "consultation_#{current_user.next_consultation.id}"
    @data = @data.map(&:searchable).sort_by { |item| item.at }
  end

  def profile
    @doctors = current_user.doctors
  end
end
