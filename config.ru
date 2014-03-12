require 'sinatra'
require './app'
require './api'

#require 'rubygems' 
#require 'bundler'
#Bundler.require 

map "/" do
  run Sinatra::Application
end

map "/api" do
  run API 
end
