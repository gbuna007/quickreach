Rails.application.routes.draw do
  # if a user signs up, take them to the CRM page
  # if a user logs in, take them to account dashboard
  # if a user logs out, take them to the landing page
  devise_for :users, controllers: { registrations: "registrations" }

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
  resources :pages, only: %i[index] # CRM page
  get "salesforce", to: "pages#salesforce" # salesforce page

  resources :accounts, only: %i[index show]

  resources :templates, only: %i[index create show]

  resources :triggers, only: %i[index create update destroy]

  resources :keywords, only: :create

  resources :drafts, only: %i[index update destroy]
end
