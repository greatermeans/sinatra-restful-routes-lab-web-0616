class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
  	@recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
  	erb :new
  end

  post '/recipes' do 
  	@recipe = Recipe.create(params)
  	redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
  	@recipe = Recipe.find(params["id"])
  	erb :show
  end

  delete '/recipes/:id/delete' do
  	@recipe = Recipe.find(params["id"])
  	@recipe.destroy
  	erb :index
  end

  get '/recipes/:id/edit' do
  	@recipe = Recipe.find(params["id"])
  	erb :edit
  end

  patch '/recipes/:id' do
  	@recipe = Recipe.find("id")
  	@recipe.update(params["name"],params["ingredients"],params["cook_time"])
  	redirect "/recipes/#{@recipe.id}"
  end

end