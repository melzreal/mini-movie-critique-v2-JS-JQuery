Rails.application.routes.draw do
  resources :commented_movies
  resources :user_movies
  resources :user_commented_movies
  resources :user_created_movies
  resources :comments
  resources :sessions
  resources :movies
  resources :users

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   
   get '/logout' => 'sessions#destroy'

  root 'users#index'
end
