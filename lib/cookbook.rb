require "date"
class CookBook
  attr_reader:recipes, :date
  def initialize
    @recipes =[]
    @date = Time.now.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.flatten
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, amount|
      require 'pry';binding.pry
    end
  end

  def summary
    info = []
    recipes.each do |recipe|
      
  end
end
