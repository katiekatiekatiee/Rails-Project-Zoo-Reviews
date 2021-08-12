Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/auth/:provider/callback', to: 'sessions#omniauth' 


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  delete '/logout', to: 'sessions#destroy'

  resources :zoos do 
    resources :reviews
  end

  resources :locations do
    resources :zoos
  end

  resources :reviews
  resources :users, only: [:new, :create, :show]
  
end





