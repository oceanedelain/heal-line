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
      "Evitez les écrans avant de vous coucher"
    ].sample
  end
end
