class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  has_many :shopping_ingredient
end
