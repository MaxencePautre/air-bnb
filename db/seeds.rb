# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "cleaning the database"
Flat.destroy_all
puts "adding new flats"

(10).times do 
  flat = Flat.new(
  name: Faker::TvShows::HowIMetYourMother.character,
  address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
  description: Faker::TvShows::HowIMetYourMother.quote,
  price_per_night: rand(30..100),
  number_of_guests: rand(1..10),
  )
  flat.save!
end

puts "Finished!"

