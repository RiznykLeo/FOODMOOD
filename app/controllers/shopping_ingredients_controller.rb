class ShoppingIngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.ingredients.each do |ingredient|
      @shopping_ingredient = ShoppingIngredient.new
      authorize @shopping_ingredient
      @shopping_ingredient.ingredient = ingredient
      @shopping_ingredient.shopping_list = current_user.current_shopping_list
      @shopping_ingredient.bought = false
      @shopping_ingredient.save
    end
    redirect_to "/list", notice: "added ingredients to your shopping list!"
  end

  def update
    @shopping_ingredient = ShoppingIngredient.find(params[:id])
    authorize @shopping_ingredient
    @shopping_ingredient.update(shopping_ingredient_params)
    redirect_to list_path
  end

  private

  def shopping_ingredient_params
    params.require(:shopping_ingredient).permit(:bought)
  end
end
