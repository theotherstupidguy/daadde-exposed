require 'sinatra' 
require 'json'
require './models'

get '/' do 
  @programmes = Programme.all
  @search = @programmes.to_json
  erb :index
end
