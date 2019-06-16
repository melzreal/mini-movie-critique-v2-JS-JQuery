Rails.application.routes.draw do
 
   get '/auth/facebook/callback' => 'sessions#create_facebook'

  resources :ratings
  resources :comments
  resources :sessions
  resources :movies 

  
  resources :users do
    # nested resource for movies
    resources :movies, only: [:show, :index]

  end

  resources :genres do
    # nested resource for movies
    resources :movies, only: [:new]

  end

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'   
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'

  # Routes for Facebook and Google authentication

  get '/auth/google_oauth2/callback' => 'sessions#create_google'
  get '/auth/github' => 'sessions#create_git'

 

  root 'users#index'
end
