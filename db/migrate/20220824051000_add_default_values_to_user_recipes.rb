class AddDefaultValuesToUserRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column(:user_recipes, :saved, :boolean, default: false)
    change_column(:user_recipes, :cooked_status, :integer, default: 0)
  end
end
