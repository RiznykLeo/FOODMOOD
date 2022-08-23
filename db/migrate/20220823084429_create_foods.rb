class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.string :edamam_id

      t.timestamps
    end
  end
end
