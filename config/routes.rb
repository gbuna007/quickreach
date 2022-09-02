Rails.application.routes.draw do
  devise_for :users, except: %i[new after_sign_up_path_for after_sign_in_path_for]

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      get '/news', to: 'news#index'
    end
  end

  # if a user signs up, take them to the CRM page
  # if a user logs in to an existing account, take them to account dashboard
  devise_for :users, controllers: { registrations: 'users/registrations' }, only: %i[new after_sign_up_path_for after_sign_in_path_for]

  root to: "pages#home" # landing page
  resources :pages, only: %i[index] # CRM page
  get "salesforce", to: "pages#salesforce"

  resources :accounts, only: %i[index show]

  resources :triggers, only: %i[index create update destroy]

  resources :drafts, only: %i[show edit]
end
