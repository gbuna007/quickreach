Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home" # landing page
  resources :pages, only: %i[index] # welcome CRM page

  resources :accounts, only: %i[index show]

  resources :templates, only: %i[index create update delete]

  resources :triggers, only: %i[index create update delete]

  resources :drafts, only: %i[index update delete]
end
