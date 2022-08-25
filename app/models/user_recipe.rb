class UserRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  enum cooked_status: [ :not_cooked, :active, :cooked ]
end
