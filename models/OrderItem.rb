
class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def to_s
    "#{id} \t #{quantity} \t #{item_price}"
  end
end
