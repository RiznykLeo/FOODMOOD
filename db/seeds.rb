# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying all the Recipes..."
Recipe.destroy_all

puts "Creating 50 dinner Recipes..."

dinner_recipes = GetRecipesService.new('dinner').call["hits"][0..50]

dinner_recipes["hits"].each do |recipe|
  rec = Recipe.create!(
    name: recipe["recipe"]["label"],
    cooking_time: recipe["recipe"]["totalTime"],
    calories: recipe["calories"],
    ingredients: recipe["ingredients"],
    source: recipe["source"],
    url: recipe["url"],
    yield: recipe["yield"],
    cuisineType: recipe["cuisineType"],
    mealType: recipe["mealType"],
    dishType: recipe["dishType"]
  )
  url = recipe["images"]["REGULAR"]["url"]
  file = URL.open(url)
  rec.photo.attach(io: file, filename: "#{rec.name}.jpg", content_type: "image/jpg")
  rec.save
end

puts "Done!"
