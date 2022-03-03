class AddProductsRefToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :products, foreign_key: true
  end
end
