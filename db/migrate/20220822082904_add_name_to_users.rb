class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :meat_preference, :string
    add_column :users, :allergies, :string
  end
end
