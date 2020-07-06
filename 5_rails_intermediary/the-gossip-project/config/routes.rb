Rails.application.routes.draw do
  root 'gossips#index'
  resources :gossips
  resources :cities, only: [:show]
  resources :users
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  get '/team', to: 'front#team'
  get '/contact', to: 'front#contact'
  get '/welcome/:first_name', to: 'front#welcome'
end
