Rails.application.routes.draw do

  resources :measures
  resources :articles

    devise_for :users
    root to: 'articles#index'
    resources :articles do
      resources :comments
    end
    namespace :api do
      namespace :v1 do
        resources :articles do
          resources :measures
        end
         
      end
    end
end