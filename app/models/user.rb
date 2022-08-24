class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shopping_lists
  has_many :user_recipes

  def current_shopping_list
    shopping_lists.find_by(completed: false) || ShoppingList.create(user: self, completed: false)
  end
end
