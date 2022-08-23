class Recipe < ApplicationRecord
  has_one_attached :photo
  has_many :ingredients
  has_many :foods, through: :ingredients
end
