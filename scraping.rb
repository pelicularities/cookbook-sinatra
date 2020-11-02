require 'nokogiri'
require 'open-uri'

def scrape(search_term)
  # takes a search term, and returns a results array in the form
  # result[0] = [name, desc]
  # result[1] = [name, desc], etc
  url = "https://www.allrecipes.com/search/?wt=#{search_term}"
  doc = Nokogiri::HTML(open(url).read, nil, 'utf-8')
  results = []
  doc.search('.fixed-recipe-card').first(5).each_with_index do |element, index|
    name = element.search('.fixed-recipe-card__h3').first.text.strip
    description = element.search('.fixed-recipe-card__description').first.text.strip
    results << [name, description]
  end
  results
end