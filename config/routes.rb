Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :articles
  root "transaction#show_profile"

  get 'transaction/import'
  post 'transaction/import'

  get 'transaction/import_from'
  post 'transaction/import_from'
end
