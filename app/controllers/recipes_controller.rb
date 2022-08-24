class RecipesController < ApplicationController
  
  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe

  end
end
