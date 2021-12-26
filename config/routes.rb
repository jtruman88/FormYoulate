Rails.application.routes.draw do
  root "static_pages#home"

  # Forms
  resources :forms, only: [:index, :show, :new, :create]

  # Submissions
  resources :submissions, only: [:show, :create]

  # Fields
  get '/field/add', to: 'fields#add'
  get '/field/updateType', to: 'fields#updateType'
  get '/field/addOption', to: 'fields#addOption'

  # Users
  get '/signup', to: 'users#new'
  resources :users, only: [:show, :create]

  # Sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
