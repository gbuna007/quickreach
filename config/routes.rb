Rails.application.routes.draw do
  devise_for :users

<<<<<<< HEAD
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      get '/news', to: 'news#index'
    end
  end

  # root to: "pages#home" # landing page
  # resources :pages, only: %i[index] # welcome CRM page
  root to: "pages#index"
=======
  root to: "pages#home" # landing page
  resources :pages, only: %i[index] # welcome CRM page
>>>>>>> main

  resources :accounts, only: %i[index show]

  resources :triggers, only: %i[index create update destroy]
end
