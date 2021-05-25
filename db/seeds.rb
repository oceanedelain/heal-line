# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database"

Consultation.destroy_all
Doctor.destroy_all
User.destroy_all

puts "Database cleaned, now create doctors"

cohen = Doctor.create(first_name: "Michael", last_name: "Cohen", specialty: "Podologue", phone_number: "0736453894", address: "2 rue de la plumerette, 94000 Créteil", email: "michael.cohen@gmail.com")
durand = Doctor.create(first_name: "Louis", last_name: "Durand", specialty: "Généraliste", phone_number: "0638495374", address: "7 Rue Léon Renault, 93260 Les Lilas", email: "louis.durand@gmail.com")
chabot = Doctor.create(first_name: "Loana", last_name: "Chabot", specialty: "Ophtalmologue", phone_number: "0636748395", address: "6 Avenue de Vorges, 94300 Vincennes", email: "loana.chabot@gmail.com")
vincent = Doctor.create(first_name: "Nathalie", last_name: "Vincent", specialty: "Dentiste", phone_number: "0647386574", address: "22 Square Alboni, 75016 Paris", email: "nathalie.vincent@gmail.com")
petit = Doctor.create(first_name: "David", last_name: "Petit", specialty: "Gynécologue", phone_number: "0646374954", address: "65 Rue d'Hautpoul, 75019 Paris", email: "david.az@gmail.com")
nour = Doctor.create(first_name: "Henri", last_name: "Nour", specialty: "Gastro-entérologue", phone_number: "0147384675", address: "7 Rue Bergère, 75009 Paris", email: "henri.nour@gmail.com")
lucas = Doctor.create(first_name: "Anne", last_name: "Lucas", specialty: "Dermatologue", phone_number: "0147384675", address: "7 Rue Bergère, 75009 Paris", email: "henri.nour@gmail.com")

puts "Doctors created, now create user"

jean = User.new(first_name: "Jean", last_name: "Dumas", email: "jean@gmail.com", password: "jean@gmail.com", gender: "Masculin", birth_date: Date.new(1990,05,20), ssn: "19075123854372", phone_number: "0618374635", address: "16 rue Villa Guadelet, 75011 Paris", blood_group: "A+", height: "185", weight: "80", allergies: "Pollen, Nickel", treatments: "Actifed allergie")
file = URI.open('https://res.cloudinary.com/di1e8ocfv/image/upload/v1621590954/jean_1_q38kqw.jpg')
jean.avatar.attach(io: file, filename: 'jean.jpg', content_type: 'image/jpg')
jean.save!

puts "User created, now create consultations"

consultation = Consultation.new(description: "Rendez-vous avec le Docteur Cohen pour des semelles orthopédiques", category: "Podologie", date: Date.new(2021,05,20), notes: "Apporter mes radios")
consultation.user = jean
consultation.doctor = cohen
file = URI.open('https://res.cloudinary.com/rachelnas/image/upload/v1621945805/radio_pied_smvxc4.jpg')
consultation.files.attach(io: file, filename: 'Radio-pied.jpg', content_type: 'image/jpg')
consultation.save!

consultation = Consultation.new(description: "Renouvellement ordonnance lentilles", category: "Ophtalmologie", date: Date.new(2021,05,10), notes: "Ne pas porter de lentilles pour le rendez-vous")
consultation.user = jean
consultation.doctor = chabot
file = URI.open('https://res.cloudinary.com/rachelnas/image/upload/v1621945897/ordonnance_lentille_slz91a.png')
consultation.files.attach(io: file, filename: 'Lentilles.png', content_type: 'image/png')
consultation.save!

consultation = Consultation.new(description: "Retirer appareil dentaire", category: "Dentiste", date: Date.new(2021,05,31), notes: "Se brosser les dents avant le rendez-vous")
consultation.user = jean
consultation.doctor = vincent
file = URI.open('https://res.cloudinary.com/rachelnas/raw/upload/v1621946795/ordonnance_word_safb5m.docx')
consultation.files.attach(io: file, filename: 'Ordonnance.docx', content_type: 'doc/docx')
consultation.save!

consultation = Consultation.new(description: "Renouveler ordonnance allergies", category: "Généraliste", date: Date.new(2021,06,10), notes: "Apporter mes résultats d'analyses")
consultation.user = jean
consultation.doctor = durand
file = URI.open('https://res.cloudinary.com/di1e8ocfv/image/upload/v1621938332/Ordonnance%20medicament.jpg')
consultation.files.attach(io: file, filename: 'Medicament.jpg', content_type: 'image/jpg')
consultation.save!

consultation = Consultation.new(description: "Rendez-vous de suivi", category: "Gastro-entérologie", date: Date.new(2021,06,18))
consultation.user = jean
consultation.doctor = durand
file = URI.open('https://res.cloudinary.com/rachelnas/raw/upload/v1621946795/ordonnance_word_safb5m.docx')
consultation.files.attach(io: file, filename: 'Ordonnance.docx', content_type: 'doc/docx')
consultation.save!

puts "All well created ! youpi !"
