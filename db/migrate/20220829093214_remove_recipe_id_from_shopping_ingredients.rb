class RemoveRecipeIdFromShoppingIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_reference :shopping_ingredients, :recipe, null: false, foreign_key: true
  end
end
