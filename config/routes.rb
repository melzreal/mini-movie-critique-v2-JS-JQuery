Rails.application.routes.draw do
 
   get '/auth/facebook/callback' => 'sessions#create_facebook'

  resources :ratings
  resources :comments
  resources :sessions
  resources :movies 

  
  resources :users do
    resources :movies, only: [:show, :index]
  end

  resources :genres do
    resources :movies, only: [:new]
  end

  scope '/admin', module: 'admin' do
    resources :manage, only: [:index, :show, :edit, :destroy]
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
