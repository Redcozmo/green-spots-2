# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'nokogiri'
require 'open-uri'

# Seed a user
#################
puts 'seeding user..............'
@user = User.create(email: 'testemail@email.com', password: "testemail", password_confirmation: 'testemail')

# Seed some spots
#################

# server message
puts '****************************SERVER*******************************'
puts 'scrapping "https://www.lyon-france.com/Je-decouvre-Lyon/activites-loisirs-et-bien-etre/Parcs-jardins-et-lieux-de-balade"..............'

# url scrapped
doc = Nokogiri::HTML(open("https://www.lyon-france.com/Je-decouvre-Lyon/activites-loisirs-et-bien-etre/Parcs-jardins-et-lieux-de-balade"))
@tab_url = []
@tab_title = []
@tab_description = []

# find specific item to scrapped
doc.css('.header-text-one a @title').each do |elem| @tab_title << elem.text end
doc.css('.list_offres .card-list-horizontal-content .col-xs-12 a img @src').each do |elem| @tab_url << elem.text end
doc.css('.list_offres .card-list-horizontal-content .col-xs-12 .description').each do |elem| @tab_description << elem.text end

# manually get geoloc of spots
@tab_latitude = [45.777411, 45.782929, 45.773373, 45.775568, 49.252947,
              45.780971, 45.798634, 45.741780, 45.762819, 45.721260, 45.785825]
@tab_longitude = [4.855225, 4.852306, 4.854822, 4.858500, 4.030319, 4.832410,
              4.940681, 4.808979, 4.823683, 4.828134, 4.730715]

# server message
puts 'seeding spots..............'

# seed
10.times do |i|
    @spot = Spot.create(name: @tab_title[i],
                        description: @tab_description[i],
                        image_url: @tab_url[i],
                        latitude: @tab_latitude[i],
                        longitude: @tab_longitude[i])
end

# Seed some taxa (plural of taxon)
##################################

@tab_feuillus = ["Alisier", "Charme", "Châtaignier", "Chêne", "Érable",
                    "Frêne", "Hêtre", "Merisier"]
@tab_resineux = ["Épicéa", "Mélèze", "Pin d’Alep", "Pin maritime",
                    "Pin sylvestre", "Pin cembro", "Pin à crochets",
                      "Pin laricio de Corse", "Sapin des Vosges"]
@tab_taxa = @tab_feuillus + @tab_resineux

# server message
puts 'seeding taxa..............'

# seed
@tab_taxa.length.times do |j|
  @taxon = Taxon.create(common_noun: @tab_taxa[j])
end

# Seed some trees
#################

# server message
puts 'seeding trees..............'

Spot.all.count.times do |k|
  50.times do |l|
    sample = @tab_taxa.sample
    @tree = Tree.create(name: sample)
    @tree.spot = Spot.find_by(id: k)
    @tree.taxon = Taxon.find_by(common_noun: sample)
    @tree.save
  end
end
