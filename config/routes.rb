Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/auth/facebook/callback', to: 'sessions#omniauth' 

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  delete '/logout', to: 'sessions#destroy'

  resources :locations
  resources :zoos
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
