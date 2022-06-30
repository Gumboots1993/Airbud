# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "json"
require "rest-client"

street = ["Flinders St VIC 3000", "Collins St VIC 3000", "La Trobe Street VIC 3000", "Lonsdale St VIC 3000"]

Booking.destroy_all
Buddy.destroy_all
User.destroy_all

user = User.create!(email: "beth@gmail.com", password: "password" )

4.times do
  response = RestClient.get "https://dog.ceo/api/breeds/image/random"
  repos = JSON.parse(response)
  buddy = Buddy.create!(name: Faker::Creature::Dog.name , buddy_type: Faker::Creature::Dog.breed , skills: Faker::Hobby.activity, description: Faker::Creature::Dog.meme_phrase , activities: Faker::Creature::Dog.sound , url: repos["message"] , location: "#{rand(300)} #{street.sample}" , rate: rand(300), user_id: user.id)
  Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "pending", user_id: user.id, buddy_id: buddy.id)
  Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "declined", user_id: user.id, buddy_id: buddy.id)
  Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Accepted", user_id: user.id, buddy_id: buddy.id)
  Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Cancelled", user_id: user.id, buddy_id: buddy.id)
end

user2 = User.create!(email: "moo@gmail.com", password: "password" )
4.times do
  response = RestClient.get "https://dog.ceo/api/breeds/image/random"
  repos = JSON.parse(response)
    buddy = Buddy.create!(name: Faker::Creature::Dog.name , buddy_type: Faker::Creature::Dog.breed , skills: Faker::Hobby.activity, description: Faker::Creature::Dog.meme_phrase , activities: Faker::Creature::Dog.sound , url: repos["message"] , location: "#{rand(300)} #{street.sample}", rate: rand(300), user_id: user2.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "pending", user_id: user2.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Declined", user_id: user2.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Accepted", user_id: user2.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Cancelled", user_id: user2.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "pending", user_id: user.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Declined", user_id: user.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Accepted", user_id: user.id, buddy_id: buddy.id)
    Booking.create!(start_date: "28/6/2022", end_date: "28/6/2022", status: "Cancelled", user_id: user.id, buddy_id: buddy.id)
end

20.times do
  response = RestClient.get "https://dog.ceo/api/breeds/image/random"
  repos = JSON.parse(response)
    buddy = Buddy.create!(name: Faker::Creature::Dog.name , buddy_type: Faker::Creature::Dog.breed , skills: Faker::Hobby.activity, description: Faker::Creature::Dog.meme_phrase , activities: Faker::Creature::Dog.sound , url: repos["message"] , location:  "#{rand(300)} #{street.sample}" , rate: rand(300), user_id: user.id)
end
