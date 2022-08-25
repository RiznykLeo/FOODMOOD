class IngredientsController < ApplicationController
  def update
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
    if @ingredient.update(ingredient_params)
      redirect_to list_path
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:bought)
  end
end
