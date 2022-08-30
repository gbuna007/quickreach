Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :pages, only: [:index]

  resources :accounts, only: [:index, :show]

  resources :templates, only: [:index, :create, :update, :delete]

  resources :triggers, only: [:index, :create, :update, :delete]

  resources :drafts, only: [:index, :update, :delete]
end
