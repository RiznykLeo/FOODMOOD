class RecipesController < ApplicationController
  def index
    @user_recipe = UserRecipe.new
    @recipes = policy_scope(Recipe)
  end
end
