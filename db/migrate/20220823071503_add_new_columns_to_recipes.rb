class AddNewColumnsToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :source, :string
    add_column :recipes, :url, :string
    add_column :recipes, :yield, :integer
    add_column :recipes, :cuisine_type, :string
    add_column :recipes, :meal_type, :string
    add_column :recipes, :dish_type, :string
  end
end
