require 'open-uri'

class GetRecipesPlainService
  attr_reader :ingredient, :app_id, :app_key, :base_url, :url

  def initialize(ingredient) #Breakfast, Lunch,  Dinner, Snack
    @ingredient = ingredient
    @app_id = ENV['EDAMAM_APP_ID']
    @app_key = ENV['EDAMAM_APP_KEY']
    @base_url = 'https://api.edamam.com/api/recipes/v2?type=public'
    @url =  "#{@base_url}&app_id=#{app_id}&app_key=#{app_key}&q=#{ingredient}"
  end


  def call
    response = JSON.parse(URI.open(url).read)
    # debugger # you can use this to stop the program and inspect the response
    # iterate over the recipes in the response to create instances of a Recipe
    # response['hits'].each do....
  end
end
