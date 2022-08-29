class UserRecipesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    @user_recipe = UserRecipe.new(recipe: recipe, user: current_user)
    authorize @user_recipe
    if @user_recipe.save
      redirect_to recipes_path, notice: "Added to cart!"
    else
      render :recipes
    end
  end

  def cart
    @user_recipes = UserRecipe.where(saved: false, user: current_user)
    authorize @user_recipes
  end

  def update
    @user_recipe = UserRecipe.find(params[:id])
    authorize @user_recipe
    if @user_recipe.update(cart_params)
      # redirect_to cart_path
      head :ok
    else
      render :edit
    end
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    authorize @user_recipe
    @user_recipe.destroy
    redirect_to cart_path, status: :see_other, notice: "Delete from your cart!"
  end

  def cookbook
    @user_recipes = UserRecipe.where(saved: true, user: current_user)
    authorize @user_recipes
  end

  private

  def cart_params
    params.require(:user_recipe).permit(:saved, :cooked_status)
  end
end
