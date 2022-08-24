class UserRecipesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    @user_recipe = UserRecipe.new(recipe: recipe, user: current_user)
    authorize @user_recipe
    if @user_recipe.save
      redirect_to root_path
    else
      render :recipes
    end
  end

  def cart
    @user_recipes = UserRecipe.where(user: current_user)
    authorize @user_recipes
  end
end
