# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.destroy_all
User.destroy_all

#seed sur user
puts "Creating Users..."



User.create!(email: 'admin@gmail.com', password: '123456')
User.create!(email: 'user@gmail.com', password: '123456')
puts "Creating Products..."
#seed sur product avec Faker et user random
10.times do
  user = User.all.sample  # On prend un utilisateur au hasard
  Product.create(
    name: Faker::Book.title,
    description: Faker::Lorem.sentence,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    quantity: Faker::Number.between(from: 1, to: 100),
    user: user
  )
end