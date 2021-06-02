class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :landing

  def landing
  end

  def home
    @scrolling_days = ((Date.today - 7.days)..(Date.today + 14.days)).to_a
    @consultations = current_user.consultations_group_by_day
  end

  def timeline
    if params[:query].present?
      @data = PgSearch.multisearch(params[:query])
    else
      @data = PgSearch::Document.all
    end

    if params.dig(:choice) == 'symptom'
      @data = @data.select { |pg_doc| pg_doc.searchable_type == "Symptom" }
      # require 'pry-byebug'; binding.pry
    elsif params.dig(:choice) == 'consultation'
      @data = @data.select { |pg_doc| pg_doc.searchable_type == "Consultation" }
    end

    params[:focus] ||= "consultation_#{current_user.next_consultation.id}"
    @data = @data.map(&:searchable).sort_by { |item| item.at }

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { data: @data } }
    end
  end

  def profile
    @doctors = current_user.doctors
  end
end
