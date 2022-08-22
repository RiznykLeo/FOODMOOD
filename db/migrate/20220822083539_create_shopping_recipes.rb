class CreateShoppingRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :shopping_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
