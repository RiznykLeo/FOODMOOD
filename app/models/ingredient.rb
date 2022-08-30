class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  belongs_to :shopping_ingredient
end
