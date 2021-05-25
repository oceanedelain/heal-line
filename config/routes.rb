Rails.application.routes.draw do
 devise_for :users
 get '/timeline', to: 'pages#timeline'

 resources :consultations, only: [ :new, :create, :edit, :update, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
