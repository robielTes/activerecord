
class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_items
  has_many :products, through: :order_items

  def to_s
    "#{id} \t #{created_at} \t #{shipped_at} \t #{status}"
  end
end
