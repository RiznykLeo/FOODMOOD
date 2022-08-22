class CreateUserRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_recipes do |t|
      t.boolean :saved
      t.integer :cooked_status
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
