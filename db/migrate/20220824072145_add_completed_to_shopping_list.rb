class AddCompletedToShoppingList < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_lists, :completed, :boolean
  end
end
