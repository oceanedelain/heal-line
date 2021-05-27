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

    @data = @data.map(&:searchable).sort_by { |item| item.at }

    # @data = [Consultation.all, Symptom.all].flatten.sort_by { |item| item.at }

    # if params.dig(:choice) == 'symptom'
    #   @data = @data.select { |item| item.is_a? Symptom }
    # elsif params.dig(:choice) == 'consultation'
    #   @data = @data.select { |item| item.is_a? Consultation }
    # else
    #   @data = PgSearch.multisearch(params[:query]).map(&:searchable).sort_by { |item| item.at }
    # end
  end
end
