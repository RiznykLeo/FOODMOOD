class AddBoughtToShoppingIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_ingredients, :bought, :boolean
  end
end
