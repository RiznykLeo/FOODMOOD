class UserRecipesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    recipe = Recipe.find(params[:recipe_id])
    @user_recipe = UserRecipe.new(recipe: recipe, user: current_user)
    authorize @user_recipe
    if @user_recipe.save
      flash[:notice] = "Added to your cart!"
      respond_to do |format|
        format.html { redirect_to recipes_path, notice: "Added to cart!" }
        format.text { render partial: "shared/flashes", formats: [:html] }
      end

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
      flash[:notice] = "Added to your cookbook!"
      respond_to do |format|
        format.text { render partial: "shared/flashes", formats: [:html] }
      end
    else
      render :edit
    end
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    authorize @user_recipe
    @user_recipe.destroy
    flash[:notice] = "Deleted"
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.text { render partial: "shared/flashes", formats: [:html] }
    end
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
