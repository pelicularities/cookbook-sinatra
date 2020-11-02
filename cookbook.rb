require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(csv_file_path) do |row|
      # Here, row is an array of columns (strings)
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # add recipe instance to array
    @recipes << recipe

    # write updated array to csv_file_path
    save_to_csv
  end

  def remove_recipe(recipe_index)
    # delete recipe instance from array
    @recipes.delete_at(recipe_index)

    # write updated array to csv_file_path
    save_to_csv
  end

  private

  def save_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
