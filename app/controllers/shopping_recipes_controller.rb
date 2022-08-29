class ShoppingRecipesController < ApplicationController
  def create
    @shopping_recipe = ShoppingRecipe.new
    authorize @shopping_recipe
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_recipe.recipe = @recipe
    @shopping_recipe.shopping_list = current_user.current_shopping_list
    @shopping_recipe.save
    redirect_to "/list", notice: "added ingredients to your shopping list!"
  end
end
