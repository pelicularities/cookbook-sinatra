require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
  end

  def list
    # return an array of recipes
    @cookbook.all
  end

  def create
    # name = @view.gets_from_user("Recipe name?")
    # description = @view.gets_from_user("Recipe description?")
    # recipe = Recipe.new(name, description)
    # @cookbook.add_recipe(recipe)
  end

  def destroy(index)
    @cookbook.remove_recipe(index)
  end

  def search
    # search_term = @view.gets_from_user("What ingredient would you like a recipe for?")
    # results = scrape_allrecipes(search_term)
    # results.each_with_index do |result, index|
    #   @view.display "#{index + 1} - #{result[0]} - #{result[1]}"
    # end

    # number = @view.gets_from_user("Which recipe would you like to import?").to_i - 1
    # recipe = Recipe.new(results[number][0], results[number][1])
    # @cookbook.add_recipe(recipe)
  end

  private

  def scrape_allrecipes(search_term)
    # takes a search term, and returns a results array in the form
    # result[0] = [name, desc]
    # result[1] = [name, desc], etc
    # url = "https://www.allrecipes.com/search/?wt=#{search_term}"
    # doc = Nokogiri::HTML(open(url).read, nil, 'utf-8')
    # results = []
    # doc.search('.fixed-recipe-card').first(5).each_with_index do |element, index|
    #   name = element.search('.fixed-recipe-card__h3').first.text.strip
    #   description = element.search('.fixed-recipe-card__description').first.text.strip
    #   results << [name, description]
    # end
    # results
  end
end
