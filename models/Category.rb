class Category < ActiveRecord::Base
  has_many :products

  def to_s
    "#{id} \t #{name} \t #{description}"
  end
end
