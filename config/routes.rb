Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :profiles, only: [:index]
  resources :followers, only: [:index]
  resources :followings, only: [:index]

end
