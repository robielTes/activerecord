class AddCategoriesRefToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :categories, foreign_key: true
  end
end
