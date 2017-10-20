require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do 
  @db = PG.connect(dbname: 'my_blog', host: 'localhost')
end

after do
  @db.close
end


# INDEX
get '/' do
  @title = 'Home'

  sql = "SELECT * FROM posts ORDER BY id"

  @post_array = @db.exec(sql)

  erb :"blog/index"
end


# SHOW
get '/:id' do 

  sql = "SELECT * FROM posts WHERE id = #{params[:id]}"

  @post = @db.exec(sql)[0]

  @title = @post['name']

  erb :"blog/show"

end


# EDIT
get '/:id/edit' do 
  sql = "SELECT * FROM posts WHERE id = #{params[:id]}"

  @post = @db.exec(sql)[0]

  @title = "Edit"

  erb :"blog/edit"
end


# UPDATE (could be PUT)
post '/:id' do

  sql = "UPDATE posts SET name = '#{params[:post_title]}', body = '#{params[:post_body]}' WHERE id = #{params[:id]}"

  @db.exec(sql)

  sql = "SELECT * FROM posts WHERE id = #{params[:id]}"

  @post = @db.exec(sql)[0]

  @title = @post['name']

  erb :"blog/show"
end


# DELETE (should be delete verb...)
post '/:id/delete' do 

  sql = "SELECT * FROM posts WHERE id = #{params[:id]}"

  @post = @db.exec(sql)[0]

  @title = "Delete"

  sql = "DELETE FROM posts WHERE id = #{params[:id]}"

  @db.exec(sql)

  erb :"blog/delete"

end


def run_sql(sql)
  connection = PG.connect(dbname: 'posts', host: 'localhost')
  result = connection.exec(sql)
  connection.close
  result
end