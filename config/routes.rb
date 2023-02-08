Rails.application.routes.draw do
  resources :articles
  get 'static/index'
    devise_for :users
    root to: 'articles#index'
    resources :articles do
      resources :comments
    end
    
    namespace :api do
      namespace :v1 do
        resources :articles
      end
    end
  end