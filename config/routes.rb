Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get '/timeline', to: 'pages#timeline'
  get '/profile', to: 'pages#profile'
  get '/fetch_consultation', to: 'consultations#fetch'

  resources :consultations, only: [ :index, :new, :create, :edit, :update, :show, :destroy ]
  resources :symptoms, only:  [ :new, :create, :edit, :update, :show, :destroy ]
  resources :doctors, only:  [ :new, :create, :edit, :update, :show, :destroy ]
  resources :documents, only:  [ :index, :new, :create, :edit, :update, :show, :destroy ]

end
