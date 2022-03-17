class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 120
      t.decimal :price, precision: 8, scale: 2, null: false
      t.text :description
      t.timestamps
    end
  end
end
