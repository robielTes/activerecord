require_relative '../connection'
require_relative '../models'
require 'faker'

music = Category.create!(name: 'MUC', description: 'musics')
movie = Category.create!(name: 'MOV', description: 'movies')
book = Category.create!(name: 'BOK', description: 'books')
games = Category.create!(name: 'GAM', description: 'Games')
puts "Category seeder done"

50.times do |id|
  Product.create!(name: Faker::Music.album, price: Faker::Commerce.price(range: 0..10.0),
                  description: "#{Faker::Music.band} #{Faker::Music.album}", categories_id: music.id, quantity: Faker::Number.between(from: 0, to: 100))
end
50.times do |id|
  Product.create!(name: Faker::Movie.title, price: Faker::Commerce.price(range: 0..50.0),
                  description: Faker::Movie.quote, categories_id: movie.id, quantity: Faker::Number.between(from: 0, to: 100))
end
50.times do |id|
  Product.create!(name: Faker::Book.title, price: Faker::Commerce.price(range: 0..20.0),
                  description: "#{Faker::Book.author} #{Faker::Book.genre }", categories_id: book.id, quantity: Faker::Number.between(from: 0, to: 100))
end
50.times do |id|
  Product.create!(name: Faker::Game.title, price: Faker::Commerce.price(range: 0..70.0),
                  description: "#{Faker::Game.genre} #{Faker::Game.platform}", categories_id: games.id, quantity: Faker::Number.between(from: 0, to: 100))
end
puts "Created #{Product.count} products"

20.times do |id|
  Supplier.create!(product_id: Faker::Number.number(digits: 2), name: Faker::Company.name, description: Faker::Company.industry)
end
puts "Created #{Supplier.count} supplier"

Client.create!(firstname: 'robiel', lastname: 'Tesfazghi')
100.times do |id|
  Client.create!(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
end
puts "Created #{Client.count} clients"

100.times do |id|
  Order.create!(created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
                shipped_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
                status: Faker::Subscription.status, clients_id: Client.random_id)
end
puts "Created #{Order.count} orders"

200.times do |id|
  OrderItem.create!(quantity: Faker::Number.between(from: 1, to: 2400), products_id: Product.random_id,
                    item_price: Faker::Commerce.price(range: 50..100.0), orders_id: Order.random_id)
end
puts "Created #{Product.count} order Items"


