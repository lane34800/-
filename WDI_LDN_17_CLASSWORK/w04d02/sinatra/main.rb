require "sinatra"
require "sinatra/reloader" if development?

get '/' do
  erb :home
end

get '/:number' do
  @number = params[:number]
  erb :account
end