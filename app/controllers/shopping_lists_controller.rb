class ShoppingListsController < ApplicationController
  def show
    @shopping_list = ShoppingList.find(params(:id))
  end

  def create
    @shopping_recipe = ShoppingRecipe.new
    @shopping_recipe.recipe = Recipe.find(params(:id))

    @shopping_list = ShoppingList.new
    @shopping_list.user = current_user

    @shopping_list.save

    @shopping_recipe.shopping_list = @shopping_list
    @shopping_recipe.save

    redirect_to :show
  end

  def update #shopping list will have to come from the params
    @shopping_recipe = ShoppingRecipe.new
    @shopping_recipe.recipe = Recipe.find(params(:id))

    @shopping_list = ShoppingList.find(params(:id))

    @shopping_recipe.shopping_list = @shopping_list
    @shopping_recipe.save

    redirect_to :show
  end

  def completed
    @shopping_list = ShoppingList.find(params(:id))
    @shopping_list.completed = true
    @shopping_list.save
    redirect_to :show
  end
end
