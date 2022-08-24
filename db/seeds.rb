# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying all the Recipes..."
# Recipe.destroy_all

puts "Creating 50 dinner Recipes..."

dinner_recipes = GetRecipesService.new('dinner').call["hits"][0..50]

dinner_recipes.each do |recipe|

  rec = Recipe.create!(
    name: recipe["recipe"]["label"],
    cooking_time: recipe["recipe"]["totalTime"],
    calories: recipe["recipe"]["calories"],
    source: recipe["recipe"]["source"],
    url: recipe["recipe"]["url"],
    yield: recipe["recipe"]["yield"],
    cuisine_type: recipe["recipe"]["cuisineType"].first,
    meal_type: recipe["recipe"]["mealType"].first,
    dish_type: recipe["recipe"]["dishType"].first
  )

  recipe["recipe"]["ingredients"].each do |ingredient|
    food = Food.find_or_create_by!(
      name: ingredient["food"],
      category: ingredient["foodCategory"],
      edamam_id: ingredient["foodId"]
    )
    Ingredient.create!(
      recipe: rec,
      food: food,
      quantity: ingredient["quantity"],
      measure: ingredient["measure"]
    )
  end


  url = recipe["recipe"]["images"]["REGULAR"]["url"]
  file = URI.open(url)
  rec.photo.attach(io: file, filename: "#{rec.name}.jpg", content_type: "image/jpg")
  rec.save
end

puts "Done!"

puts "Creating User"

User.create!(email: "daniel.hamm@gmx.de", name: "Daniel Hamm", password: "123456")

puts "Done!"
