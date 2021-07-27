Rails.application.routes.draw do
  root to: 'pages#landing'
  devise_for :users
  resources :users, only: %i[show]

  get '/home', to: 'pages#home'
  get '/timeline', to: 'pages#timeline'
  get '/profile', to: 'pages#profile'
  get '/fetch_consultation', to: 'consultations#fetch'

  resources :consultations, only: [ :index, :new, :create, :edit, :update, :show, :destroy ] do
    get '/link_document', to: 'consultations#link_document'
    get '/unlink_document', to: 'consultations#unlink_document'
  end
  resources :symptoms, only:  [ :new, :create, :edit, :update, :show, :destroy ]
  resources :doctors, only:  [ :new, :create, :edit, :update, :show, :destroy ]
  resources :documents, only:  [ :index, :new, :create, :edit, :update, :show, :destroy ]

end
