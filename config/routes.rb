Rails.application.routes.draw do
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
