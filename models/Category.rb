class Category < ActiveRecord::Base
  has_many :products
  has_many :suppliers, through: :products

  has_many :orders, through: :products
  has_many :order_items, through: :products
  def to_s
    "#{id} \t #{name} \t #{description}"
  end

  def self.never_ordered
    #all.find_all {|category| category.products.all? {|product| product.order_items.empty?}}
    #all.find_all {|category| category.order_items.empty?}
    where.not(id: joins(:orders))
  end
end
