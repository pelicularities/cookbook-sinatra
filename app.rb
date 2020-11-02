require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "cookbook"
require_relative "recipe"
require_relative "scraping"

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  recipe = Recipe.new(params[:name], params[:description])
  cookbook.add_recipe(recipe)
  redirect '/'
end

get '/delete/:id' do
  index = @params[:id].to_i - 1
  cookbook.remove_recipe(index)
  redirect '/'
end

get '/search' do
  @results = scrape(params[:q]) if params[:q]
  erb :search
end