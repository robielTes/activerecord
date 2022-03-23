class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.integer :product_id
      t.text :name
      t.text :description
    end
  end
end
