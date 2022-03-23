require_relative 'connection'
require_relative 'models'


product = Product.first
good_comment = Comment.create(body:'nice product', target: product)
product.comments << good_comment
#product.comments.create(body:'nice product', target: product)
