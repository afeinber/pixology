Rails.application.routes.draw do
  devise_for :users
  root 'home#index'


  resources :images
  resources :profiles, only: [:show]
  resources :images do
    resources :comments
  end
  resources :comments do
    resources :comments
  end

end
