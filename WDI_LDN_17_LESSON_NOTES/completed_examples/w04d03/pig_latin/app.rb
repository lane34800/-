require "sinatra"
require "sinatra/reloader" if development? 
require_relative "model/translator.rb"



# GET ROOT
get "/" do
  @title = "Oink Oink"
  erb :home
end


# POST TRANSLATE
post "/translate" do

  @title = "Oink Oink Output"                                     #Create instance var to pass pageTitle to view 

  words = params[:word].split(" ")                                #Get form data data through 'params' and use .split(' ') to convert array of words 
  translation = []                                                #Create var to hold translated text

  words.each do |word|                                            #Run a for loop
    translation << Translator.translate(word)                       #pass the word to the function 'Translator.tranlate', shovel it into array.
  end

  @new_words = translation.join(' ')                              #convert the array to string and make it accessable to the view

  erb :translate                                                #render translated.erb

end