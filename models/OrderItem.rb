
class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  #validates :products_id, :product, presence: true
  #validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}

  before_save :set_item_price

  def price
    quantity * item_price
  end

  protected

  def set_item_price
    self.item_price ||= product.price
  end

  def to_s
    "#{id} \t #{quantity} \t #{item_price}"
  end

  #OrderItem.where("item_price = '#{OrderItem.maximum('item_price')}'")

end
