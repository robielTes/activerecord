
require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR',description: 'produit')
sup = Category.create!(name: 'SUP',description: 'Little apple')
ele = Category.create!(name: 'ELE',description: 'SUP')
gam = Category.create!(name: 'GAM',description: 'Gaming')
puts "Category seeder done"

product1 = Product.create!(name: 'apple', price: 2.35, description: 'Little apple', categories_id: pcr.id)
product2 = Product.create!(name: 'lemon', price: 6.15, description: 'Big lemon', categories_id: pcr.id)
product3 = Product.create!(name: 'limousine', price: 25.95, description: 'A limousine', categories_id: sup.id)
product4 = Product.create!(name: 'truck', price: 200, description: 'A truck', categories_id: sup.id)
product5 = Product.create!(name: 'GTA', price: 25.95, description: 'A limousine', categories_id: gam.id)
product6 = Product.create!(name: 'fifa22', price: 69, description: 'A truck', categories_id: gam.id)
puts "Product seeder done"

client1 = Client.create!(firstname: 'robiel', lastname: 'Tesfazghi')
client2 = Client.create!(firstname: 'yannick', lastname: 'baudraz')
client3 = Client.create!(firstname: 'john', lastname: 'doedoe')
puts "Client seeder done"


order1 = Order.create!(status: 'PROGRESS', clients_id: client1.id)
order2 = Order.create!(status: 'PROGRESS', clients_id: client2.id)
order3 = Order.create!(status: 'DELEVERED', clients_id: client2.id)
order4 = Order.create!(status: 'DELEVERED', clients_id: client3.id)
puts "Order seeder done"



OrderItem.create!(quantity: 2, item_price: 235, products_id: product1.id, orders_id: order1.id)
OrderItem.create!(quantity: 125,item_price: 25, products_id: product3.id, orders_id: order1.id)
OrderItem.create!(quantity: 3,item_price: 35, products_id: product4.id, orders_id: order1.id)

OrderItem.create!(quantity: 1, item_price: 1.35, orders_id: order2.id, products_id: product1.id)
OrderItem.create!(quantity: 75, item_price: 2.5, orders_id: order2.id, products_id: product2.id)
OrderItem.create!(quantity: 3, item_price: 135, orders_id: order2.id, products_id: product3.id)
OrderItem.create!(quantity: 200, item_price: 245, orders_id: order2.id, products_id: product4.id)

OrderItem.create!(quantity: 2, item_price: 26, products_id: product1.id, orders_id: order1.id)
OrderItem.create!(quantity: 125, item_price: 2935, products_id: product3.id, orders_id: order1.id)
OrderItem.create!(quantity: 3, item_price: 205, products_id: product4.id, orders_id: order1.id)

OrderItem.create!(quantity: 1, item_price: 5, orders_id: order2.id, products_id: product6.id)
OrderItem.create!(quantity: 75, item_price: 35, orders_id: order2.id, products_id: product2.id)
OrderItem.create!(quantity: 3, item_price: 2, orders_id: order2.id, products_id: product5.id)
OrderItem.create!(quantity: 200, item_price: 2.35, orders_id: order2.id, products_id: product4.id)

puts '--SEEDERS DONE--'