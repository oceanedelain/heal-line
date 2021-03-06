# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database"

Symptom.destroy_all
Doctor.destroy_all
Document.destroy_all
Consultation.destroy_all
User.destroy_all

puts "Database cleaned, now create doctors"

cohen = Doctor.create!(first_name: "Michael", last_name: "Cohen", specialty: "Podologue", phone_number: "0736453894", address: "2 rue de la plumerette, 94000 Créteil", email: "michael.cohen@gmail.com")
durand = Doctor.create!(first_name: "Louis", last_name: "Durand", specialty: "Généraliste", phone_number: "0638495374", address: "7 Rue Léon Renault, 93260 Les Lilas", email: "louis.durand@gmail.com")
chabot = Doctor.create!(first_name: "Loana", last_name: "Chabot", specialty: "Ophtalmologue", phone_number: "0636748395", address: "6 Avenue de Vorges, 94300 Vincennes", email: "loana.chabot@gmail.com")
vincent = Doctor.create!(first_name: "Nathalie", last_name: "Vincent", specialty: "Dentiste", phone_number: "0647386574", address: "22 Square Alboni, 75016 Paris", email: "nathalie.vincent@gmail.com")
petit = Doctor.create!(first_name: "David", last_name: "Petit", specialty: "Gynécologue", phone_number: "0646374954", address: "65 Rue d'Hautpoul, 75019 Paris", email: "david.az@gmail.com")
nour = Doctor.create!(first_name: "Henri", last_name: "Nour", specialty: "Gastro-entérologue", phone_number: "0147384675", address: "7 Rue Bergère, 75009 Paris", email: "henri.nour@gmail.com")
lucas = Doctor.create!(first_name: "Anne", last_name: "Lucas", specialty: "Dermatologue", phone_number: "0147384675", address: "7 Rue Bergère, 75009 Paris", email: "anne.lucas@gmail.com")

puts "Doctors created, now create user"

jean = User.new(first_name: "Oceane", last_name: "Delain", email: "oceane@gmail.com", password: "oceane@gmail.com", gender: "Féminin", birth_date: Date.new(1990,05,20), ssn: "29075123854372", phone_number: "0618374635", address: "16 rue Villa Guadelet, 75011 Paris", blood_group: "A+", height: "170", weight: "54", allergies: "Pollen, Nickel", treatments: "Actifed allergie")
file = URI.open('https://res.cloudinary.com/di1e8ocfv/image/upload/v1622648156/portrait_frx0ei.jpg')
jean.avatar.attach(io: file, filename: 'oceane.jpg', content_type: 'image/jpg')
jean.save!

puts "User created, now create consultations"

consultation_iep = Consultation.new(description: "Semelles orthopédiques", category: "Podologie", at: DateTime.parse("05/05/2021 11:30"), notes: "Apporter les radios de mes pieds et genous")
consultation_iep.user = jean
consultation_iep.doctor = cohen
consultation_iep.save!

consultation_yeux = Consultation.new(description: "Ordonnance lentilles", category: "Ophtalmologie", at: DateTime.parse("10/05/2021 10:15"), notes: "Ne pas porter de lentilles pour le rendez-vous")
consultation_yeux.user = jean
consultation_yeux.doctor = chabot
consultation_yeux.save!

consultation = Consultation.new(description: "Appareil dentaire", category: "Dentiste", at: DateTime.parse("30/05/2021 18:30"), notes: "Se brosser les dents avant le rendez-vous")
consultation.user = jean
consultation.doctor = vincent
consultation.save!

consultation = Consultation.new(description: "Douleurs pieds", category: "Généraliste", at: DateTime.parse("10/06/2021 09:00"), notes: "Apporter ma radio")
consultation.user = jean
consultation.doctor = durand
consultation.save!

consultation = Consultation.new(description: "Rendez-vous de suivi", category: "Gastro-entérologie", at: DateTime.parse("10/06/2021 19:00"), notes: "Manger léger")
consultation.user = jean
consultation.doctor = nour
consultation.save!

consultation = Consultation.new(description: "Soin détartrage", category: "Dentiste", at: DateTime.parse("07/06/2021 17:30"), notes: "Devis à signer")
consultation.user = jean
consultation.doctor = vincent
consultation.save!

consultation = Consultation.new(description: "Vaccin 1ère dose", category: "Généraliste", at: DateTime.parse("11/06/2021 11:00"), notes: "Etre à jeun")
consultation.user = jean
consultation.doctor = durand
consultation.save!

consultation = Consultation.new(description: "Vaccin 2ème dose", category: "Généraliste", at: DateTime.parse("19/07/2021 11:00"), notes: "Etre à jeun")
consultation.user = jean
consultation.doctor = durand
consultation.save!

consultation = Consultation.new(description: "Blanchiment des dents", category: "Dentiste", at: DateTime.parse("22/07/2021 14:30"), notes: "Ramener le devis signé")
consultation.user = jean
consultation.doctor = vincent
consultation.save!


puts "Consultations created, now create symptoms"

symptom = Symptom.new(at: DateTime.parse("01/01/2021 14:00"), name: "Migraine", zone: "Tête", notes: "Migraine avec perte de vision, nausées et perte d'équilibre", intensity: 8, duration: 7)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("04/01/2021 15:00"), name: "Tendinite", zone: "Bras", notes: "Après deux heures de tennis", intensity: 4, duration: 4)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("23/02/2021 14:00"), name: "Migraine", zone: "Tête", notes: "Petite migraine d'après soirée", intensity: 2, duration: 3)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("10/03/2021 15:00"), name: "Courbatures", zone: "Bras", notes: "Retour de ma tendinite ou courbatures ?", intensity: 3, duration: 2)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("01/04/2021 10:00"), name: "Démangeaisons", zone: "Yeux", notes: "Oeil droit très sec", intensity: 2, duration: 6)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("10/04/2021 07:00"), name: "Migraine", zone: "Tête", notes: "Sensation de marteau qui tape dans ma tête et je ne supporte ni les écrans, ni la lumière", intensity: 5, duration: 3)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("04/05/2021 10:12"), name: "Migraine", zone: "Tête", notes: "Des nausées et des vertiges se sont ajoutés aux sensations habituelles", intensity: 5, duration: 4)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("15/05/2021 19:00"), name: "Ballonnements", zone: "Ventre", notes: "Ventre gonflé et du mal à digérer", intensity: 4, duration: 6)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("21/05/2021 03:35"), name: "Courbatures", zone: "Bras", notes: "Douleurs à chaque effort", intensity: 3, duration: 10)
symptom.user = jean
symptom.save!

symptom = Symptom.new(at: DateTime.parse("25/05/2021 15:15"), name: "Démangeaisons", zone: "Yeux", notes: "Oeil droit qui gratte et qui pleure", intensity: 2, duration: 7)
symptom.user = jean
symptom.save!


puts "Symptoms created, now create documents"

document = Document.new(document_type: "Imagerie médicale", name: "radios", at: DateTime.parse("05/02/2021 11:30"), notes: "1 radio grand format")
document.user = jean
file = URI.open('https://res.cloudinary.com/rachelnas/image/upload/v1621945805/radio_pied_smvxc4.jpg')
document.file.attach(io: file, filename: 'Radio-pied.jpg', content_type: 'image/jpg')
document.consultation = consultation_iep
document.save!


document = Document.new(document_type: "Ordonnance de médicaments", name: "lentilles renouvellement", at: DateTime.parse("12/05/2021 15:30"), notes: "Pour 6 mois de vue tranquille")
document.user = jean
file = URI.open('https://res.cloudinary.com/rachelnas/image/upload/v1621945897/ordonnance_lentille_slz91a.png')
document.file.attach(io: file, filename: 'Lentilles.png', content_type: 'image/png')
document.consultation = consultation_yeux
document.save!

document = Document.new(document_type: "Ordonnance de médicaments", name: "allergies", at: DateTime.parse("25/04/2021 15:30"), notes: "Pour le pollen l'été")
document.user = jean
file = URI.open('https://res.cloudinary.com/di1e8ocfv/image/upload/v1622582344/ordonnance_pollen_fklzsu.jpg')
document.file.attach(io: file, filename: 'Pollen.jpg', content_type: 'image/jpg')
document.save!

document = Document.new(document_type: "Ordonnance de médicaments", name: "douleurs tendinite", at: DateTime.parse("11/03/2021 15:30"), notes: "Douleurs chroniques")
document.user = jean
file = URI.open('https://res.cloudinary.com/di1e8ocfv/image/upload/v1621938332/Ordonnance%20medicament.jpg')
document.file.attach(io: file, filename: 'Medicament.jpg', content_type: 'image/jpg')
document.save!

puts "All well created ! youpi !"
