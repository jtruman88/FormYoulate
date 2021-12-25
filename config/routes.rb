Rails.application.routes.draw do
  root "forms#index"

  resources :forms

  get '/field/add', to: 'fields#add'
  get '/field/updateType', to: 'fields#updateType'
  get '/field/addOption', to: 'fields#addOption'
end
