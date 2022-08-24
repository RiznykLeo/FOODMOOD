class UserRecipesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    @user_recipe = UserRecipe.new(recipe: recipe, user: current_user)
    authorize @user_recipe
    if @user_recipe.save
      redirect_to cart_path
    else
      render :recipes
    end
  end

  def cart
    @user_recipes = UserRecipe.where(user: current_user)
    authorize @user_recipes
  end

  def cookbook
    @user_recipes = UserRecipe.where(user: current_user)
    authorize @user_recipes
  end

  def update
    @user_recipe = Recipe.find(params[:id])
    @user_recipe.saved = true
    authorize @user_recipe
    if @user_recipe.update
      redirect_to cart_path
    else
      render :edit
    end
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    authorize @user_recipe
    @user_recipe.destroy
    redirect_to cart_path, status: :see_other
  end
end
