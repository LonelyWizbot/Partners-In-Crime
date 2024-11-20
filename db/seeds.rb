# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# 1. Clean the database 🗑️
puts 'Cleaning database...'
Partner.destroy_all
User.destroy_all
Booking.destroy_all

# 2. Create the instances 🏗️
puts 'Creating users...'

users = []

6.times do
  users << User.create!(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        email: Faker::Internet.email,
                        password: Faker::Internet.password(min_length: 6),
                        address: Faker::Address.street_address,
                        additional_address: Faker::Address.secondary_address,
                        zip_code: Faker::Address.zip_code,
                        city: Faker::Address.city,
                        phone_number: Faker::Number.leading_zero_number(digits: 10))
end

puts 'Creating partners...'

Partner.create!(title: "Gendre idéal",
                description: "Tu veux rendre jaloux tes cousins et épater la tante curieuse?
                Fais appel à moi! Mariages, dîners de famille, baptêmes – je m’intègre partout.
                Charme, humour et conversations captivantes sur tout (oui, même sur les plantes d'intérieur).
                En gros, je suis l'atout parfait pour un événement mémorable.
                Tes parents se demanderont pourquoi je ne viens pas plus souvent!",
                image: "https://ca.slack-edge.com/T02NE0241-UP3USJP7F-115d30a81011-512",
                price: 200,
                user_id: users.sample.id)

Partner.create!(title: "Super Mamie",
                description: "Besoin de quelqu'un pour applaudir à s'en fatiguer les mains et murmurer des 'c'était bien mon chéri'
                              à la sortie du spectacle? Je suis la grand-mère idéale à louer!
                              Toujours prête avec des bonbons dans le sac, des compliments exagérés et une patience inébranlable.
                              Je maîtrise l'art du tricot et du 'tu sais, à mon époque...' pour une immersion totale.
                              Vous allez regretter de ne pas m'avoir eue plus tôt!",
                image: "https://images.pexels.com/photos/5638674/pexels-photo-5638674.jpeg",
                price: 150,
                user_id: users.sample.id)

Partner.create!(title: "Candidat à louer",
                description: "Trop de révisions et pas assez de siestes? Je prends ta place pour ta semaine d'examens!
                              Expert en techniques de gribouillage confiant et réponses inventives,
                              je maîtrise l'art du 'ça passe ou ça casse'. Sourire détendu inclus, même en maths avancées.
                              Tu dors, je stresse : le rêve, non?",
                image: "https://ca.slack-edge.com/T02NE0241-U07QHLV9AQM-5d80c2f24c3e-512",
                price: 100,
                user_id: users.sample.id)

Partner.create!(title: "Remplaçant de Déménagement",
                description: "Assez de te coincer le dos à porter le canapé de ton pote ? Laisse-moi faire !
                              Je me pointe, je sue, je râle un peu pour l'ambiance, et je sors des blagues douteuses pour détendre l'atmosphère.
                              Cartons, meubles qui ne passent jamais la porte, tout ça, c’est mon job.
                              Toi, tu restes peinard et tu profites de ta journée sans crainte du 'tu m'aides à porter le frigo?'",
                image: "https://ca.slack-edge.com/T02NE0241-U01HQ8S07RC-492a348bec10-512",
                price: 300,
                user_id: users.sample.id)

Partner.create!(title: "Double Parfait pour l’Open Space",
                description: "Marre des réunions qui auraient pu être des e-mails et des pauses café interminables?
                              Je prends ta place au bureau! Je maîtrise le regard concentré sur l’écran, le “hmm” en réunion et la discussion météo à la pause.
                              Personne ne verra la différence, promis.
                              Toi, tu profites de ta journée, moi, je fais semblant de comprendre le dernier rapport trimestriel.",
                image: "https://ca.slack-edge.com/T02NE0241-U07Q6DY7JDV-248edbfd1dc2-512",
                price: 150,
                user_id: users.sample.id)

Partner.create!(title: "Éclaireur de Date",
                description: "Envie de filtrer les rencards foireux sans risquer ta soirée? J’y vais à ta place!
                              Je scrute les signes d'alerte : discours bizarre, longues histoires d’ex, et poils suspects.
                              Je gère les discussions gênantes et les silences longs pour te dire si ça vaut le coup.
                              Si tout est bon, je te passe le relai avec un rapport détaillé; sinon, tu te contentes de ma conclusion : 'fais-toi un bol de pâtes et oublie ça!'",
                image: "https://ca.slack-edge.com/T02NE0241-U07QHR2QZS9-7c9461ea9b4d-512",
                price: 250,
                user_id: users.sample.id)

puts "Seeding complete! Created #{User.count} users and #{Partner.count} partners"
