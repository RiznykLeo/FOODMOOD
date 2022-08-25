class AddBoughtToShoppingList < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :bought, :boolean, default: false
  end
end
