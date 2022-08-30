class Recipe < ApplicationRecord
  has_one_attached :photo
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :user_recipes, dependent: :destroy
end
