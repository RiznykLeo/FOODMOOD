class RecipesController < ApplicationController

  def index
    @user_recipe = UserRecipe.new
    @recipes = policy_scope(Recipe).where.not(id: current_user.recipes)
    if params[:recipe]
      top_recipe = @recipes.find{|recipe| recipe.id == params[:recipe].to_i}
      @recipes.delete_at(@recipes.index(top_recipe))
      @recipes << top_recipe
    end

  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @shopping_ingredient = ShoppingIngredient.new
  end
end
