# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Buddy.new(name: "Fido", buddy_type: "dog", skills: "barks", description: "is cute", activities: "Walkies", url:"https://thegoldfishtank.com/wp-content/uploads/2020/12/bubble-eye-goldfish-1-768x576.jpg", location:"berlin" rate: 100, user_id: 1)
Booking.new(start_date: "28/6/2022", end_date: "28/6/2022", status: "pending", user_id: 1, buddy_id: 1)
User.new(email: "beth@gmail.com", encrypted_password: "password" )
