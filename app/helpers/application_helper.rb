module ApplicationHelper
  def random_conseil
    [
      "Buvez 2 litres d\'eau/jour",
      "Essayez de faire 10.000 pas/jour",
      "Pratiquez une activité physique régulière",
      "Evitez de manger trop gras/sucré/salé",
      "Pensez à manger 5 fruits et légumes/ jour",
      "Essayez de dormir 8h/nuit",
      "Mangez des fruits et légumes de saison",
      "Prenez du temps pour vous détendre",
      "Evitez de consommer régulièrement de l'alcool",
      "Evitez les écrans avant de vous coucher",
      "Faites-vous aider pour arrêter de fumer"
    ].sample
  end

  def circle_color
    week = (Date.today..Date.today + 7).to_a
    return 'circle-orange' if week.include?(current_user.next_consultation.at.to_date) if current_user
    return 'circle-blue'
  end

  def data_type(item)
    # @data.class.to_s.downcase
    item.is_a?(Symptom) ? 'symptom' : 'consultation'
  end

  def active_class(name)
    return 'active' if name == action_name && ['pages'].include?(controller_name)
  end

  def btn_active_class(name)
    return 'btn-active' if params[:choice] == name
  end
end


#{btn_active_class(params[:choice])}
