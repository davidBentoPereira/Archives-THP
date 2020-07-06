Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events
  resources :users
  resources :attendances, only: [:show, :destroy, :new, :create]
  resources :charges
  post 'create_attendance' => 'attendances#create', as: :create_attendance

  namespace :admin do
    root 'dashboard#index'
    resources :dashboard
  end
end
