Rails.application.routes.draw do
 
  resources :genres
  resources :comments
  resources :sessions
  resources :movies
  
  resources :users do
    # nested resource for movies
    resources :movies, only: [:show, :index]
  end

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'

  

  root 'users#index'
end
