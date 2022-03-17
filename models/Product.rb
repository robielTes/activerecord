
class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  class Company < Client
    #belongs_to :client
  end

  def to_s
    "#{id} \t  #{name} \t #{price} \t #{description}"
  end

  def self.random_id
    return self.all.shuffle.first.id
  end

end
