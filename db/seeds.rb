# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
10.times do
    Hotel.create(name: Faker::Restaurant.name, location: Faker::Address.city) 
end

5.times do
    User.create(name: Faker::Name.name, city: Faker::Address.city, phone:Faker::PhoneNumber.phone_number) 
end

(101..105).each do |number|
    Room.create(number:number, hotel_id:Hotel.first.id) 
end
