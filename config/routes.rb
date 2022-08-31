Rails.application.routes.draw do
  devise_for :users

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      get '/news', to: 'news#index'
    end
  end

  root to: "pages#home" # landing page
  resources :pages, only: %i[index] # welcome CRM page

  resources :accounts, only: %i[index show]

  resources :triggers, only: %i[index create update destroy]
end
