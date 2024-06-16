Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :articles
  root "transaction#show_profile"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'transaction/import'
  post 'transaction/import'

  get 'transaction/import_from'
  post 'transaction/import_from'

  get 'transaction/filter'
  post 'transaction/filter'

  get 'transaction/index'
  post 'transaction/index'
end
