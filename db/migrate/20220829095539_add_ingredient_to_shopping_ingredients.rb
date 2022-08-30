class AddIngredientToShoppingIngredients < ActiveRecord::Migration[7.0]
  def change
    ShoppingIngredient.destroy_all
    add_reference :shopping_ingredients, :ingredient, null: false, foreign_key: true
  end
end
