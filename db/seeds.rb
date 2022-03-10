
require_relative '../connection'
require_relative '../models'
require 'faker'

music = Category.create!(name: 'MUC',description: 'musics')
movie = Category.create!(name: 'MOV',description: 'movies')
book = Category.create!(name: 'BOK',description: 'books')
games = Category.create!(name: 'GAM',description: 'Games')
puts "Category seeder done"

20.times do |id|
  Product.create!(name: Faker::Music.album, price: Faker::Commerce.price(range:1..20.0), description: "#{Faker::Music.band} #{Faker::Music.album}", categories_id: music.id)
end

20.times do |id|
  Product.create!(name: Faker::Movie.title , price: Faker::Commerce.price(range:2..50.0), description: Faker::Movie.quote, categories_id: movie.id)
end

20.times do |id|
  Product.create!(name: Faker::Book.title, price: Faker::Commerce.price(range:0..80.0), description: "#{Faker::Book.author} #{Faker::Book.genre }", categories_id: book.id)
end

20.times do |id|
  Product.create!(name: Faker::Game.title, price: Faker::Commerce.price(range:2..100.0), description: "#{Faker::Game.genre} #{Faker::Game.platform}", categories_id: games.id)
end
puts "Created #{Product.count} games"


Client.create!(firstname: 'robiel', lastname: 'Tesfazghi')
100.times do |id|
  Client.create!(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
end
puts "Created #{Client.count + 1} clients"

100.times do |id|
  Order.create!(status: Faker::Subscription.status , clients_id: Faker::Number.between(from: 1, to: 100), shipped_at:Faker::Time.between(from: DateTime.now - 365, to: DateTime.now))
end
puts "Created #{Order.count + 1} orders"


200.times do |id|
  OrderItem.create!(quantity: Faker::Number.non_zero_digit, item_price:Faker::Commerce.price(range:50..100.0), products_id: Faker::Number.between(from: 1, to: 80), orders_id:Faker::Number.between(from: 1, to: 100))
end
puts "Created #{Product.count + 1} order Items"
