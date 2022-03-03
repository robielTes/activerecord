class AddOrdersRefToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :orders, foreign_key: true
  end
end
