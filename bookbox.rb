
require 'sinatra'
require 'sinatra/reloader' if development?
require './config/environment.rb'

get '/' do
    erb :index
end

get '/library' do
    erb :library
end

post '/books' do
    "I confirm I want to add #{params[:title]} by #{params[:author]} "
end