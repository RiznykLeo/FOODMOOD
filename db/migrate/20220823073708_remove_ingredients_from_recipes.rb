class RemoveIngredientsFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :ingredients, :string
  end
end
