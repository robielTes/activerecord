class ProductObserver < ActiveRecord::Observer

  def before_update(product)
    if self.quantity < 5
      puts "We have #{self.quantity} #{self.name}"
    end
  end

end
