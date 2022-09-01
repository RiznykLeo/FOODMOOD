class RecipesController < ApplicationController
  def index
    @user_recipe = UserRecipe.new
    @recipes = policy_scope(Recipe).where.not(id: current_user.recipes).order(created_at: :asc)
    if params[:recipe]
      top_recipe = @recipes.find { |recipe| recipe.id == params[:recipe].to_i }
      @recipes.delete_at(@recipes.index(top_recipe))
      @recipes << top_recipe
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @shopping_ingredient = ShoppingIngredient.new
  end

  def search
    @user_recipes = Recipe.all
    authorize @user_recipes
    if params[:query].present?
      sql_query = <<~SQL
        recipes.name ILIKE :query
        OR foods.name ILIKE :query
      SQL
      @user_recipes = Recipe.joins(:foods).distinct.where(sql_query, query: "%#{params[:query]}%")

    end
  end
end
