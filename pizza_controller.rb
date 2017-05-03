require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#INDEX - READ
get '/pizzas' do
  @pizzas = Pizza.all()
  erb( :index )
end

# NEW - CREATE
get '/pizzas/new' do
  erb(:new)
end

# SHOW - READ
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

# CREATE - CREATE
post '/pizzas' do

  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

# DESTROY -DELETE
post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  redirect('/pizzas')
end

#EDIT - UPDATE
get '/pizzas/:id/edit' do
  @pizza = Pizza.new(params)
  @pizza.update()
  redirect('/pizzas')
end



