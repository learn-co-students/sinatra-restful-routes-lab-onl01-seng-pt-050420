class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
  end

  get '/recipes' do
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post '/recipes' do
    new_recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    new_recipe.save

    redirect to "/recipes/#{new_recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    original_recipe = Recipe.find(params[:id])
    original_recipe.update(title: params[:name], content: params[:ingredients])

    redirect to "/recipes/#{original_recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect to '/recipes'
  end

end
