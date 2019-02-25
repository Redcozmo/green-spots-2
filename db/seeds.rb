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

################################################################################
# Prise terrain avec application OSMAnd
################################################################################
# server message
puts '..............Premières données terrain..............'
# Seed some taxa (plural of taxon)
##################################
@tab_taxa2 =
{ "taxons": [
  {
    common_noun: "Cèdre du Liban",
    family: "Pinacées",
    genus: "Cedrus",
    species: "Libani"
  },
  {
    common_noun: "Chêne Pubescent",
    family: "Fagacées",
    genus: "Quercus",
    species: "Pubescens"
  },
  {
    common_noun: "Erable de Cappadoce",
    family: "Acéracées",
    genus: "Acer",
    species: "Cappadocicum"
  },
  {
    common_noun: "Magnolia grandiflora",
    family: "Magnoliacées",
    genus: "Magnolia",
    species: "Grandiflora"
  },
  {
    common_noun: "Marronnier d'Inde",
    family: "Hippocastanacées",
    genus: "Aesculus",
    species: "Hippocastanum"
  },
  {
    common_noun: "Oranger des osages",
    family: "Moracées",
    genus: "Maclura",
    species: "Pomifera"
  },
  {
    common_noun: "Pin parasol, Pin pignon",
    family: "Pinacées",
    genus: "Pinus",
    species: "Pinea"
  },
  {
    common_noun: "Pinus Bengeana",
    family: "Pinacées",
    genus: "Pinus",
    species: "Bengeana"
  },
  {
    common_noun: "Séquoia géant",
    family: "Taxodiacées",
    genus: "Sequoiadendron",
    species: "Giganteum"
  },
  {
    common_noun: "Sequoia Sempervirens",
    family: "Taxodiacées",
    genus: "Sequoia",
    species: "Sempervirens"
  },
  {
    common_noun: "Sophora du Japon",
    family: "Légumineuses",
    genus: "Stypholobium",
    species: "Japonicom"
  }
]}

# server message
puts 'seeding taxa..............'

# seed
@tab_taxa2[:taxons].length.times do |j|
  @taxon = Taxon.create(common_noun: @tab_taxa2[:taxons][j][:common_noun],
                        family: @tab_taxa2[:taxons][j][:family],
                        genus: @tab_taxa2[:taxons][j][:genus],
                        species: @tab_taxa2[:taxons][j][:species])
end

# Seed some trees
#################

@tab_trees2 = { "trees": [
  {
    name: "Cèdre du Liban",
    latitude: 45.774826,
    longitude: 4.851204
  },
  {
    name: "Cèdre du Liban",
    latitude: 45.774864,
    longitude: 4.8556967
  },
  {
    name: "Chêne Pubescent",
    latitude: 45.77502,
    longitude: 4.8579483
  },
  {
    name: "Erable de Cappadoce",
    latitude: 45.773945,
    longitude: 4.8555775
  },
  {
    name: "Magnolia grandiflora",
    latitude: 45.774357,
    longitude: 4.8553495
  },
  {
    name: "Marronnier d'Inde",
    latitude: 45.773926,
    longitude: 4.8546963
  },
  {
    name: "Oranger des osages",
    latitude: 45.77385,
    longitude: 4.856053
  },
  {
    name: "Pin parasol, Pin pignon",
    latitude: 45.77455,
    longitude: 4.858084
  },
  {
    name: "Pinus Bengeana",
    latitude: 45.774105,
     longitude: 4.857193
   },
  {
    name: "Séquoia géant",
    latitude: 45.780815,
    longitude: 4.8480725
  },
  {
    name: "Sequoia Sempervirens",
    latitude: 45.77433,
    longitude: 4.8569493
  },
  {
    name: "Sophora du Japon",
    latitude: 45.773834,
    longitude: 4.8559003
  }
]}

# server message
puts 'seeding trees..............'

@tab_trees2[:trees].length.times do |j|
  @tree = Tree.create(name: @tab_trees2[:trees][j][:name],
                      latitude: @tab_trees2[:trees][j][:latitude],
                      longitude: @tab_trees2[:trees][j][:longitude])
  @tree.spot = Spot.find_by(name: "Parc de la Tête d'Or")
  @tree.taxon = Taxon.find_by(common_noun: @tab_trees2[:trees][j][:name])
  @tree.save
end
