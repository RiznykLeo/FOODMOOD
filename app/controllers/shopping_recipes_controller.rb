class ShoppingRecipesController < ApplicationController
  def create
    @shopping_recipe = ShoppingRecipe.new
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_recipe.recipe = @recipe
    @shopping_list = current_user.current_shopping_list
  end
end
