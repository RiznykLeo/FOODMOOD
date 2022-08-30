class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_ingredients
  has_many :ingredients, through: :shopping_ingredients
end
