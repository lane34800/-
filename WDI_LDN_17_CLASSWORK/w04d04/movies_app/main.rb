require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'httparty'
require 'pg'

before do 
  @db = PG.connect(dbname: 'movie_app', host: 'localhost')
end

after do
  @db.close
end
 
get '/' do
  @title = params[:title]

  if @title && @title > ""

    @url_title = @title.gsub(' ', '+')

    url = "http://www.omdbapi.com/?t=#{@url_title}"
    html = HTTParty.get(url)
  
    sql = "insert into movies (title, year, rated, released, runtime, genre, director, writers, actors, plot, poster) values (#{sql_string(html['Title'])}, '#{html['Year']}', '#{html['Rated']}', '#{html['Released']}', '#{html['Runtime']}', '#{html['Genre']}', '#{html['Director']}', '#{html['Writer']}', '#{html['Actors']}', #{sql_string(html['Plot'])}, '#{html['Poster']}')"

    @db.exec(sql)
    @hash = html

  end

  erb :movie
end

get '/movies' do
  #WRITE YOUR CODE HERE 

  sql = "SELECT * FROM movies"

  @movie_array = @db.exec(sql)

  erb :movies

end

post '/delete/:id&:title' do

  @message = "Deleted #{params[:title]} <a href='/movies'>Back</a>"
  sql = "DELETE FROM movies WHERE id = #{params[:id].to_i}"

  @db.exec(sql)
  @message

end

def sql_string(value)
  "'#{value.to_s.gsub("'", "''")}'"
end















