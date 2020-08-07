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
    erb :create
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  post '/recipes' do
    recipe = Recipe.create(params)

    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy

    redirect '/recipes'
  end

  patch '/recipes/:id' do
    Recipe.find(params[:id]).update(params)
    
    redirect "/recipes/#{params[:id]}"
  end


end
