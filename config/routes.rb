Rails.application.routes.draw do
 
   get '/auth/facebook/callback' => 'sessions#create_facebook'


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

   get '/destroy/:id'=> 'movies#destroy'


  root 'users#index'
end
