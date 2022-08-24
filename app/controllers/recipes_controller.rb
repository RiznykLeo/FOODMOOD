class RecipesController < ApplicationController

  def index
    @user_recipe = UserRecipe.new
    @recipes = policy_scope(Recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @shopping_recipe = ShoppingRecipe.new
  end
end
