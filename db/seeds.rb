# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

5.times{
  restaurant_new = Restaurant.new(name: Faker::Restaurant.unique.name, adress: Faker::Address.full_address, phone: Faker::PhoneNumber.phone_number_with_country_code,category: Faker::Restaurant.type)
  restaurant_new.save!
  puts "#{restaurant_new}"
}
