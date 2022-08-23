class ChangeCaloriesToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column(:recipes, :calories, :float)
  end
end
