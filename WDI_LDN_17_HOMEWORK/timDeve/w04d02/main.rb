require "sinatra"
require "sinatra/reloader" if development?

require_relative "functions"


get "/" do
  @phrase = ""
  erb :home
end

post "/" do
  @phrase = pig_latin_sentence(params[:phrase])
  erb :home
end