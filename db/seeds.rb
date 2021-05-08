# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
User.destroy_all
Listing.destroy_all
Reservation.destroy_all


Faker::Config.locale = 'fr-FR'

10.times do
  City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

20.times do
  User.create!(email: Faker::Internet.email, phone_number: Faker::PhoneNumber.subscriber_number(length: 10), description: Faker::Lorem.sentence(word_count: 7))
end

50.times do
  Listing.create!(available_beds: Faker::Number.number(digits: 1).positive, price: Faker::Number.within(range: 50.0..600.0), description: Faker::Lorem.characters(number: 160, min_alpha: 140), has_wifi: Faker::Boolean.boolean, welcome_message: Faker::Lorem.sentence(word_count: 5), city: City.all.sample, user: User.all.sample)
end

#past reservations
5.times do
  Reservation.create!(start_date: Faker::Date.backward(days: 20), end_date: Faker::Date.backward(days: 10), user: User.all.sample, listing: Listing.all.sample)

#new reservations
  Reservation.create!(start_date: Faker::Date.forward(days: 5), end_date: Faker::Date.forward(days: 20), user: User.all.sample, listing: Listing.all.sample)
end
