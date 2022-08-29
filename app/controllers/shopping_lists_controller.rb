class ShoppingListsController < ApplicationController
  def show
    @list = current_user.current_shopping_list
    authorize @list
  end

  def update
    @shopping_list = ShoppingList.find(params[:id])
    authorize @shopping_list
    if @shopping_list.update(shopping_list_params)
      redirect_to "/list", notice: "Emptied your shopping list!"
    else
      render :edit
    end
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:completed)
  end
end
