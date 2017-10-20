require "sinatra"
require "sinatra/reloader" if development?


get "/" do

  @title = "Home"

  erb :home

end


post "/display" do

  params[:destination]

end