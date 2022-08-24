class Recipe < ApplicationRecord
  has_one_attached :photo
  has_many :ingredients
  has_many :foods, through: :ingredients
  has_many :shopping_recipes
  has_many :shopping_lists, through: :shopping_recipes
end
