Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :images
  resources :profiles, only: [:show]
end
