require 'dotenv/load'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'


#DO NOT DO THIS IN YOUR PROJECT!
connection = PG::Connection.open(
    :host =>ENV['host'],
    :port => ENV['port'],
    :dbname => ENV['dbname'],
    :user => ENV['user'],
    :password => ENV['pw'])

get '/' do
    erb :index
end

get '/library' do
    erb :library
end

get '/booklist' do
    books = connection.exec_params("SELECT author FROM books").values[0]
    books
end

post '/books' do
    "I confirm I want to add #{params[:title]} by #{params[:author]} "
end