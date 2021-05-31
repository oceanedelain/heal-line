Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  get '/timeline', to: 'pages#timeline'
  get '/profile', to: 'pages#profile'

  resources :consultations, only: [ :new, :create, :edit, :update, :show, :destroy ]
  resources :symptoms, only:  [ :new, :create, :edit, :update, :show, :destroy ]
  resources :documents, only:  [ :index, :new, :create, :edit, :update, :show, :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
