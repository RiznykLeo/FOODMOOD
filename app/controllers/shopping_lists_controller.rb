class ShoppingListsController < ApplicationController
  def show
    @list = current_user.current_shopping_list
    authorize @list
  end
end
