class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.text :name, limit: 50, null: false
      t.text :description
    end
  end
end
