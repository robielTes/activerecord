
class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_items
  has_many :products, through: :order_items

  #validates :clients_id, :client, presence: true
  #validates_associated :clients_id

  def price
    #order_items.sum {|item| item.price}
    order_items.sum(&:price)
  end

  def to_s
    "#{id} \t #{created_at} \t #{shipped_at} \t #{status}"
  end

  def self.random_id
    return self.all.shuffle.first.id
  end

end
