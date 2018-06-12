# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying generated users"
generate_users = User.where(generated: true)
generate_users.destroy_all

puts "Creating 20 new users"
20.times do
  putc "."
  User.create!(
    username:   Faker::Internet.user_name,
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    location:   "#{Faker::Address.city}, #{Faker::Address.state}",
    bio:        Faker::Lorem.paragraph,
    password:   "123456",
    password_confirmation: "123456",
    email:      Faker::Internet.email,
    generated:  true,
  )
end
puts "\nDone"
