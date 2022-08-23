# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dinner_recipes = GetRecipesService.new('dinner').call["hits"][0..50]

# dinner_recipes["hits"].each do |recipe|
#   Recipe.create!(
#     name: recipe["recipe"]["label"],

#   )
# end
