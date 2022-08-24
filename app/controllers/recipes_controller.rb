class RecipesController < ApplicationController
  def index
    @recipes = Recipe.new
    authorize @recipes
    @recipes = policy_scope(Recipe)
  end
end
