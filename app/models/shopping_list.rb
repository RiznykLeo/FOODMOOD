class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_recipes
  has_many :recipes, through: :shopping_recipes
end
