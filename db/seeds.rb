# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all



10.times do 
	User.create!(
	first_name: Faker::Name.first_name, 
	last_name: Faker::Name.last_name,
	description: Faker::GreekPhilosophers.quote,
	email: Faker::Lorem.word + "@yopmail.com", 
	password: Faker::String.random(length: 6)
	)
end 

5.times do 
	Event.create!(
	start_date: Faker::Date.forward(days: 45),
	duration: [10,15,20,25,30,35,40].sample,
	title: Faker::Lorem.sentence(word_count: 3),
	description: Faker::GreekPhilosophers.quote,
	price: rand(1..1000),
	admin_id: rand(User.first.id..User.last.id),
	location: Faker::Space.planet
	)
end 

20.times do 
	Attendance.create!(
	stripe_customer_id: Faker::Lorem.characters(number: 5),  
	user_id: rand(User.first.id..User.last.id),
	event_id: rand(Event.first.id..Event.last.id)
	)
end 

puts "fake data initialized"