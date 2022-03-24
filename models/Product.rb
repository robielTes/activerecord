class Product < ActiveRecord::Base.observers << :product_observer
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :comments, as: :target



  def to_s
    "#{id} \t  #{name} \t #{price} \t #{description} \t #{quantity}"
  end

  def self.random_id
    return self.all.shuffle.first.id
  end
end

class Supplier < ActiveRecord::Base
  has_many :comments, as: :target
end