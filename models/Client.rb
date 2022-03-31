class Client < ActiveRecord::Base
  has_many :orders

  #validates :firstname, :lastname, length: { minimum: 2, maximum: 60 }

  def self.random_id
    return self.all.shuffle.first.id
  end

  def to_s
    "#{id} \t #{firstname} \t #{lastname}"
  end

  def self.without_orders
    #joins(:orders).where(orders: {id: nil})
    where.missing(:orders)
  end




end

class Individual < Client
  belongs_to :client
end

class Company < Client
  belongs_to :client
end
