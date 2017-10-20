require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'


get "/" do
  
  erb :home

end


get "/products" do
  
  sql = "SELECT id, name, price, description, quantity_in_stock FROM products"

  @products = run_sql(sql)

  erb :"products/index"

end

get "/products/:id" do
  
 sql = "SELECT * FROM products WHERE id = #{params[:id]}";

 @product = run_sql(sql).first

 erb :"products/show"

end


get "/products/:id/edit" do
  
 sql = "SELECT * FROM products WHERE id = #{params[:id]}";

 @product = run_sql(sql).first

 erb :"products/edit"

end

put "/products/:id/edit" do
  
  sql = "UPDATE products SET name = '#{params[:name]}', price = #{params[:price]}, description = '#{params[:description]}' WHERE id = #{params[:id]}"

  run_sql(sql)

  redirect "/products/#{params[:id]}"

end

def run_sql(sql)
  connection = PG.connect(dbname: "gregs", host: 'localhost')
  result = connection.exec(sql)
  connection.close
  return result
end