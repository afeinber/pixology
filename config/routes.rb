Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :interests, only:[:create, :destroy]
  resources :follows, only:[:create, :destroy]
  resources :users, only: [:show]
  resources :notifications, only: [:show, :index]

  resources :images do
    resources :comments, only: [:create, :destroy]
  end
  resources :comments, only: [:create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

end
