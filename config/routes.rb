Pinteresting::Application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    resources :notes, only: [:index, :create, :update, :destroy]
  end

  root 'pages#home' #use root_path 
  get "about" => "pages#about" #creates about_path

#  get "notes/new"

end
