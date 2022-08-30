class ChangeShoppingRecipesToShoppingIngredients < ActiveRecord::Migration[7.0]
  def change
    rename_table :shopping_recipes, :shopping_ingredients
  end
end
