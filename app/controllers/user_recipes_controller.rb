class UserRecipesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    raise
    @user_recipe = UserRecipe.new(recipe: recipe)
  end
end
