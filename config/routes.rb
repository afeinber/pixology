Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :images
  resources :interests, only:[:create, :destroy]
  resources :follows, only:[:create, :destroy]
  resources :users, only: [:show]
end
